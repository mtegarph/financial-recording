part of 'financial_bloc.dart';

abstract class FinancialState extends Equatable {
  const FinancialState();

  @override
  List<Object> get props => [];
}

class FinancialInitial extends FinancialState {}

class FinancialLoading extends FinancialState {}

class FinancialLoaded extends FinancialState {
  final List<FinancialRecordEntity> financialRecordEntity;
  final String totalBalance;
  final double totalIncome;
  final double totalExpenses;
  const FinancialLoaded({
    required this.financialRecordEntity,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpenses,
  });
}

class FinancialError extends FinancialState {
  final String message;
  const FinancialError({required this.message});
}
