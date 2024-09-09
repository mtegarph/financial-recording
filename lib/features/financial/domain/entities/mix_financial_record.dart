import 'dart:developer';

mixin MixFinancialRecord {
  int? get id;
  String get name;
  String get description;
  String get type;
  String get category;
  String get subCategory;
  DateTime get date;
  String get time;
  String get amount;
  String get currency;
  String get note;
  String get image;
  String get status;
  String get createdAt;
  String get updatedAt;
  String get deletedAt;

  void printName() {
    log("data nama $name");
  }
}
