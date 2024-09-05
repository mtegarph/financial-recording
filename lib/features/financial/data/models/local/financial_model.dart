import 'package:financial_recording/core/variable/const_variable.dart';

class FinancialModel {
  int? id;
  String description;
  String value;
  String category;
  String date;

  FinancialModel(
      {required this.description,
      required this.value,
      required this.category,
      required this.date,
      this.id});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnDescription: description,
      columnValue: value,
      columnCategory: category,
      columnDate: date
    };
    map[columnId] = id;
    return map;
  }

  factory FinancialModel.fromMap(Map<String, Object?> map) {
    return FinancialModel(
        id: map[columnId] as int?,
        description: map[columnDescription].toString(),
        category: map[columnCategory].toString(),
        value: map[columnValue].toString(),
        date: map[columnDate].toString());
  }
}
