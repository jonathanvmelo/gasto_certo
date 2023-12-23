import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExpenseModelSqflite {
  int? id;
  double? amount;
  String? description;
  DateTime? date;
  ExpenseModelSqflite({
    this.id,
    this.amount,
    this.description,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'description': description,
      'date': date,
    };
  }

  ExpenseModelSqflite.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    amount = map['amount'] ?? 0;
    description = map['description'];
    date = map['date'];
  }
  toJson() => json.encode(toMap());
}

int trataData(dynamic data) {
  if (data == null) return 0;
  if (data is int) return data;
  var date = data != null
      ? DateTime.parse(
          data.toString().replaceAll('T', ' '),
        ).millisecondsSinceEpoch
      : 0;
  return date;
}
