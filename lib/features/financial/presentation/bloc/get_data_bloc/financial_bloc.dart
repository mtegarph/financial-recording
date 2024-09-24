import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:financial_recording/core/firebase/firebase_remote_config.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_balance.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_expenses.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_income.dart';
import 'package:financial_recording/features/financial/domain/usecases/list_financial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'financial_event.dart';
part 'financial_state.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  final ListFinancialUseCase listFinancialUseCase;
  final GetBalanceUseCase getBalanceUseCase;
  final GetExpensesUseCase getExpensesUseCase;
  final GetIncomeUseCase getIncomeUseCase;
  final ShorebirdCodePush _shorebirdCodePush;
  FinancialBloc(this.listFinancialUseCase, this.getBalanceUseCase,
      this.getExpensesUseCase, this.getIncomeUseCase,
      {ShorebirdCodePush? codePush})
      : _shorebirdCodePush = codePush ?? ShorebirdCodePush(),
        super(FinancialInitial()) {
    on<GetDataEvent>(_onGetData);
  }

  void _onGetData(GetDataEvent event, Emitter<FinancialState> emit) async {
    emit(FinancialLoading());

    try {
      final info = NetworkInfo();
      final isConnected = await info.getWifiIP();
      final result = await listFinancialUseCase.call();
      final balance = await getBalanceUseCase.call();
      final expenses = await getExpensesUseCase.call();
      final income = await getIncomeUseCase.call();
      var welcome = await getWelcomeText();

      remoteConfig.onConfigUpdated.listen(
        (event) async {
          await remoteConfig.activate();
          for (var key in event.updatedKeys) {
            if (key == 'welcome_text') {
              final data = remoteConfig.getString('welcome_text');
              debugPrint('update data 2 $data');
              welcome = data;
            }
          }
        },
      );
      final isUpdate =
          isConnected != '192.168.1.9' ? false : await _getUpdate();
      emit(FinancialLoaded(
          financialRecordEntity: result,
          totalBalance: balance,
          welcomeText: welcome,
          isUpdate: isConnected != '192.168.1.9' ? false : isUpdate,
          totalExpenses: expenses,
          ipAddress: isConnected ?? '',
          totalIncome: income));
      log('get data remote config: ${remoteConfig.getBool('is_dark_mode')}');
      final data = jsonDecode(remoteConfig.getString('point_reward'));
      log('get data new User: ${data['message_welcome']}');
    } catch (e) {
      emit(FinancialError(message: e.toString()));
    }
  }

  Future<bool> _getUpdate() async {
    final updateAvailable =
        await _shorebirdCodePush.isNewPatchAvailableForDownload();
    if (updateAvailable) {
      try {
        await _shorebirdCodePush.downloadUpdateIfAvailable();
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
      try {
        final isNewPatchUpdate =
            await _shorebirdCodePush.isNewPatchReadyToInstall();
        return isNewPatchUpdate;
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    }
    return false;
  }
}
