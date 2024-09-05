class FinancialRecordEntity {
  final int? id;
  final String description;
  final String value;
  final String category;
  final DateTime date;

  FinancialRecordEntity(
      {required this.description,
      required this.value,
      required this.category,
      required this.date,
      this.id});
}
