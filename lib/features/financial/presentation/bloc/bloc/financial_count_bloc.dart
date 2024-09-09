import 'package:bloc/bloc.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/usecases/add_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/delete_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/update_financial.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_count_event.dart';
part 'financial_count_state.dart';
part 'financial_count_bloc.freezed.dart';

class FinancialCountBloc
    extends Bloc<FinancialCountEvent, FinancialCountState> {
  final AddFinancialUsecase addFinancialUsecase;
  final UpdateFinancialUsecase updateFinancialUsecase;
  final DeleteFinancialUsecase deleteFinancialUsecase;
  FinancialCountBloc(this.addFinancialUsecase, this.updateFinancialUsecase,
      this.deleteFinancialUsecase)
      : super(FinancialCountState.initial()) {
    on<_AddData>(_onAddData);
    on<_UpdateData>(_onUpdateData);
    on<_DeleteData>(_onDeleteData);
  }

  void _onAddData(
    _AddData event,
    Emitter<FinancialCountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = FinancialRecordEntity(
          date: DateTime.now(),
          description: event.description,
          value: event.value,
          category: event.category,
          amount: event.value,
          createdAt: DateTime.now().toString(),
          currency: 'Rp',
          deletedAt: DateTime.now().toString(),
          image: DateTime.now().toString(),
          name: event.description,
          note: event.description,
          status: event.description,
          subCategory: event.description,
          time: event.description,
          type: event.description,
          updatedAt: event.description);
      await addFinancialUsecase.call(params: data);
      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: 'Data berhasil ditambahkan'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
  }

  void _onUpdateData(
    _UpdateData event,
    Emitter<FinancialCountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      debugPrint(event.financialRecordEntity.toString());
      final data = FinancialRecordEntity(
          id: event.financialRecordEntity.id,
          date: DateTime.now(),
          description: event.financialRecordEntity.description,
          value: event.financialRecordEntity.value,
          category: event.financialRecordEntity.category,
          amount: event.financialRecordEntity.amount,
          createdAt: DateTime.now().toString(),
          currency: 'Rp',
          deletedAt: DateTime.now().toString(),
          image: DateTime.now().toString(),
          name: event.financialRecordEntity.description,
          note: event.financialRecordEntity.description,
          status: event.financialRecordEntity.description,
          subCategory: event.financialRecordEntity.description,
          time: event.financialRecordEntity.description,
          type: event.financialRecordEntity.description,
          updatedAt: event.financialRecordEntity.description);
      await updateFinancialUsecase.call(params: data);
      emit(state.copyWith(
          isLoading: false, isSuccess: true, message: 'Data berhasil diubah'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
  }

  void _onDeleteData(
    _DeleteData event,
    Emitter<FinancialCountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await deleteFinancialUsecase.call(params: event.financialRecordEntity);
      emit(state.copyWith(
          isLoading: false, isSuccess: true, message: 'Data berhasil dihapus'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
  }
}
