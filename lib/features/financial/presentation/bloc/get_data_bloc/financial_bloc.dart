import 'package:equatable/equatable.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_balance.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_expenses.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_income.dart';
import 'package:financial_recording/features/financial/domain/usecases/list_financial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'financial_event.dart';
part 'financial_state.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  final ListFinancialUseCase listFinancialUseCase;
  final GetBalanceUseCase getBalanceUseCase;
  final GetExpensesUseCase getExpensesUseCase;
  final GetIncomeUseCase getIncomeUseCase;
  FinancialBloc(this.listFinancialUseCase, this.getBalanceUseCase,
      this.getExpensesUseCase, this.getIncomeUseCase)
      : super(FinancialInitial()) {
    on<GetDataEvent>(_onGetData);
  }

  void _onGetData(GetDataEvent event, Emitter<FinancialState> emit) async {
    emit(FinancialLoading());

    try {
      final result = await listFinancialUseCase.call();
      final balance = await getBalanceUseCase.call();
      final expenses = await getExpensesUseCase.call();
      final income = await getIncomeUseCase.call();
      emit(FinancialLoaded(
          financialRecordEntity: result,
          totalBalance: balance,
          totalExpenses: expenses,
          totalIncome: income));
    } catch (e) {
      emit(FinancialError(message: e.toString()));
    }
  }
}
