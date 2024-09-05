part of 'financial_bloc.dart';

abstract class FinancialEvent extends Equatable {
  const FinancialEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends FinancialEvent {}
