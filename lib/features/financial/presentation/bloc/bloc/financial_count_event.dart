part of 'financial_count_bloc.dart';

@freezed
class FinancialCountEvent with _$FinancialCountEvent {
  const factory FinancialCountEvent.started() = _Started;
  const factory FinancialCountEvent.addData(
    final String description,
    final String value,
    final String category,
  ) = _AddData;
  const factory FinancialCountEvent.updateData(
    final FinancialRecordEntity financialRecordEntity,
  ) = _UpdateData;

  const factory FinancialCountEvent.deleteData(
    final FinancialRecordEntity financialRecordEntity,
  ) = _DeleteData;
}
