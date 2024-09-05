part of 'add_financial_bloc.dart';

sealed class AddFinancialState extends Equatable {
  const AddFinancialState();

  @override
  List<Object> get props => [];
}

final class AddFinancialInitial extends AddFinancialState {}

class AddFinancialLoading extends AddFinancialState {}

class AddFinancialError extends AddFinancialState {
  final String message;

  const AddFinancialError({required this.message});
}

class AddFinancialSuccess extends AddFinancialState {}
