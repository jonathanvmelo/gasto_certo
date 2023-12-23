import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/data/models/transaction_model.dart';
import 'package:gasto_certo/app/repositories/expense_repository.dart';

class BlocTransactionLocal extends ChangeNotifier {
  final _repository = ExpenseRepository();
  List<TransactionsModel> expenseList = [];
  final _streamController = StreamController<int>.broadcast();

  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;
  int counter = 0;

  void increment() {
    counter++;
    input.add(counter);
    log(counter.toString());
    notifyListeners();
  }

  void decrement() {
    counter--;
    input.add(counter);
    log(counter.toString());
    notifyListeners();
  }

  void addExpense(TransactionsModel expense) async {
    var item = await _repository.addExpense(item: expense);
    input.add(item);
  }
}
