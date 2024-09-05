part of 'add_financial_bloc.dart';

sealed class AddFinancialEvent extends Equatable {
  const AddFinancialEvent();

  @override
  List<Object> get props => [];
}

class AddData extends AddFinancialEvent {
  final String description;
  final String value;
  final String category;

  const AddData(
      {required this.description, required this.value, required this.category});
}

class UpdateData extends AddFinancialEvent {
  final FinancialRecordEntity financialRecordEntity;

  const UpdateData({required this.financialRecordEntity});
}

class DeleteData extends AddFinancialEvent {
  final FinancialRecordEntity financialRecordEntity;

  const DeleteData({required this.financialRecordEntity});
}
