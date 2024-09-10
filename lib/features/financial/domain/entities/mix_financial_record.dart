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

extension Mixdata on MixFinancialRecord {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'category': category,
      'subCategory': subCategory,
      'date': date.toIso8601String(),
      'time': time,
      'amount': amount,
      'currency': currency,
      'note': note,
      'image': image,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
