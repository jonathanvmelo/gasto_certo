// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gasto_certo/app/common/enums/enum_categories.dart';

class TransactionsModel {
  String? id;
  String? description;
  String? date;
  double? amount;
  Categories? category;

  TransactionsModel({
    this.id,
    this.description,
    this.date,
    this.amount,
    this.category,
  });

  TransactionsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
    amount = map['amount'];
    date = map['date'];
  }

  TransactionsModel.fromJson(Map<String, dynamic> json, String expenseId) {
    id = expenseId;
    description = json['description'] ?? "";
    if (json['amount'] != null) {
      amount = (json['amount'] as double).toDouble();
    }
    date = json['date'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'description': description,
      'expense': amount,
      'date': date,
    };

    if (id != null) {
      json['id'] = id;
    }

    return json;
  }
}
