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
            id: element.id,
            description: element.description,
            value: element.value,
            category: element.category,
            date: DateTime.now(),
            amount: element.value,
            createdAt: DateTime.now().toString(),
            currency: 'Rp',
            deletedAt: DateTime.now().toString(),
            image: DateTime.now().toString(),
            name: element.description,
            note: element.description,
            status: element.description,
            subCategory: element.description,
            time: element.description,
            type: element.description,
            updatedAt: element.description));
      }
      resultParse.first.printName();
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
