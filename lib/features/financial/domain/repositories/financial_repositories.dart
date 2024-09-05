import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';

abstract class FinancialRepositories {
  Future<void> create(FinancialRecordEntity className);
  Future<void> update(FinancialRecordEntity className);
  Future<void> delete(FinancialRecordEntity className);
  Future<List<FinancialRecordEntity>> findAll();
  Future<String> getTotalBalance();
  Future<double> getTotalIncome();
  Future<double> getTotalExpenses();
}
