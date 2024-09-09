part of 'financial_count_bloc.dart';

@freezed
class FinancialCountState with _$FinancialCountState {
  const factory FinancialCountState({
    required String message,
    required bool isLoading,
    required bool isSuccess,
  }) = _FinancialCountState;
  factory FinancialCountState.initial() => const FinancialCountState(
        message: '',
        isLoading: false,
        isSuccess: false,
      );
}
