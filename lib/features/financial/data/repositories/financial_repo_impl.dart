import 'package:financial_recording/features/financial/data/datasources/local/financial_data_source.dart';
import 'package:financial_recording/features/financial/data/models/local/financial_model.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class FinancialRepoImpl implements FinancialRepositories {
  final FinancialDataSource financialDataSource;

  FinancialRepoImpl({required this.financialDataSource});

  @override
  Future<void> create(FinancialRecordEntity className) async {
    try {
      await financialDataSource.insertFinancial(FinancialModel(
          date: DateTime.now().toString(),
          description: className.description,
          value: className.value,
          category: className.category));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> delete(FinancialRecordEntity className) async {
    try {
      await financialDataSource.deleteFinancial(className.id.toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<FinancialRecordEntity>> findAll() async {
    try {
      final result = await financialDataSource.getAllFinancials();
      List<FinancialRecordEntity> resultParse = [];
      for (var element in result) {
        resultParse.add(FinancialRecordEntity(
            date: DateTime.parse(element.date),
            id: element.id ?? 0,
            description: element.description,
            category: element.category,
            value: element.value));
      }
      return resultParse;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> update(FinancialRecordEntity className) async {
    try {
      await financialDataSource.updateFinancial(FinancialModel(
          id: className.id,
          description: className.description,
          date: DateTime.now().toString(),
          value: className.value,
          category: className.category));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getTotalBalance() async {
    try {
      final result = await financialDataSource.getTotalBalance();
      return result.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<double> getTotalExpenses() async {
    try {
      final result = await financialDataSource.getTotalExpenses();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<double> getTotalIncome() async {
    try {
      final result = await financialDataSource.getTotalIncome();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
