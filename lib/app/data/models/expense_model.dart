// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

class ExpenseModel {
  String? id = '';
  String? description;
  String? date;
  int? iconColor; // Change the type to Color
  double? amount;
  int? transactions;

  ExpenseModel({
    this.id,
    required this.description,
    required this.date,
    this.iconColor,
    required this.amount,
    required this.transactions,
  });

  ExpenseModel.fromJson(Map<String, dynamic> json, String id) {
    id = json['id'] ?? "";
    description = json['description'] ?? "";
    amount = json['amount'] ?? "";
    date = json['date'] ?? "";
    iconColor = json['iconColor'] ?? 4282536512;
    transactions = json['transactions'] ?? 0;
    log(json['iconColor']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'description': description,
      'amount': amount,
      'iconColor': iconColor,
      'date': date,
    };

    if (id != null) {
      json['id'] = id;
    }

    return json;
  }
}
