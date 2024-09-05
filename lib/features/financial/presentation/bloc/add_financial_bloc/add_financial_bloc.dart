import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/usecases/add_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/delete_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/update_financial.dart';
import 'package:flutter/material.dart';

part 'add_financial_event.dart';
part 'add_financial_state.dart';

class AddFinancialBloc extends Bloc<AddFinancialEvent, AddFinancialState> {
  final AddFinancialUsecase addFinancialUsecase;
  final UpdateFinancialUsecase updateFinancialUsecase;
  final DeleteFinancialUsecase deleteFinancialUsecase;

  AddFinancialBloc(this.addFinancialUsecase, this.updateFinancialUsecase,
      this.deleteFinancialUsecase)
      : super(AddFinancialInitial()) {
    on<AddData>(_addFinancial);
    on<UpdateData>(_updateFinancial);
    on<DeleteData>(_deleteFinancial);
  }
  void _addFinancial(AddData event, Emitter<AddFinancialState> emit) async {
    emit(AddFinancialLoading());
    try {
      final data = FinancialRecordEntity(
          date: DateTime.now(),
          description: event.description,
          value: event.value,
          category: event.category);
      await addFinancialUsecase.call(params: data);
      emit(AddFinancialSuccess());
    } catch (e) {
      emit(AddFinancialError(message: e.toString()));
    }
  }

  void _updateFinancial(
      UpdateData event, Emitter<AddFinancialState> emit) async {
    emit(AddFinancialLoading());
    try {
      debugPrint('data ${event.financialRecordEntity.description}');
      await updateFinancialUsecase.call(params: event.financialRecordEntity);

      emit(AddFinancialSuccess());
    } catch (e) {
      emit(AddFinancialError(message: e.toString()));
    }
  }

  void _deleteFinancial(
      DeleteData event, Emitter<AddFinancialState> emit) async {
    emit(AddFinancialLoading());
    try {
      await deleteFinancialUsecase.call(params: event.financialRecordEntity);
      emit(AddFinancialSuccess());
    } catch (e) {
      emit(AddFinancialError(message: e.toString()));
    }
  }
}
