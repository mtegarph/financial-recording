import 'package:financial_recording/features/financial/domain/entities/mix_financial_record.dart';

class FinancialRecordEntity with MixFinancialRecord {
  @override
  final int? id;
  @override
  final String description;
  final String value;
  @override
  final String category;
  @override
  final DateTime date;
  @override
  final String amount;

  @override
  final String createdAt;

  @override
  final String currency;

  @override
  final String deletedAt;

  @override
  final String image;

  @override
  final String name;

  @override
  final String note;

  @override
  final String status;

  @override
  final String subCategory;

  @override
  final String time;

  @override
  final String type;

  @override
  final String updatedAt;
  FinancialRecordEntity(
      {required this.description,
      required this.value,
      required this.category,
      required this.date,
      required this.amount,
      required this.createdAt,
      required this.currency,
      required this.deletedAt,
      required this.image,
      required this.name,
      required this.note,
      required this.status,
      required this.subCategory,
      required this.time,
      required this.type,
      required this.updatedAt,
      this.id});
}
