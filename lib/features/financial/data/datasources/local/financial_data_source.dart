import 'package:financial_recording/core/variable/const_variable.dart';
import 'package:financial_recording/features/financial/data/models/local/financial_model.dart';
import 'package:sqflite/sqflite.dart';

class FinancialDataSource {
  final Database database;

  FinancialDataSource({required this.database});

  Future<int> insertFinancial(FinancialModel financial) async {
    Database db = database;
    return await db.insert(tableFinancial, financial.toMap());
  }

  Future<List<FinancialModel>> getAllFinancials() async {
    Database db = database;
    List<Map<String, dynamic>> maps = await db.query(tableFinancial);
    return List.generate(maps.length, (i) => FinancialModel.fromMap(maps[i]));
  }

  Future<double> getTotalIncome() async {
    Database db = database;
    var result = await db.rawQuery('''
      SELECT SUM(CAST($columnValue AS REAL)) as total
      FROM $tableFinancial
      WHERE $columnCategory = ?
    ''', ['Pemasukan']);
    return result.first['total'] as double? ?? 0.0;
  }

  Future<double> getTotalExpenses() async {
    Database db = database;
    var result = await db.rawQuery('''
      SELECT SUM(CAST($columnValue AS REAL)) as total
      FROM $tableFinancial
      WHERE $columnCategory = ?
    ''', ['Pengeluaran']);
    return result.first['total'] as double? ?? 0.0;
  }

  Future<double> getTotalBalance() async {
    final income = await getTotalIncome();
    final expense = await getTotalExpenses();
    return income + expense;
  }

  Future<int> updateFinancial(FinancialModel financial) async {
    Database db = database;
    return await db.update(
      tableFinancial,
      financial.toMap(),
      where: '$columnId = ?',
      whereArgs: [financial.id],
    );
  }

  Future<int> deleteFinancial(String id) async {
    Database db = database;
    return await db.delete(
      tableFinancial,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
