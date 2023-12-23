import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/bloc/bloc-expenses/transaction_event.dart';
import 'package:gasto_certo/app/common/utils/functions.dart';
import 'package:gasto_certo/app/data/models/transaction_model.dart';
import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';
import 'package:rxdart/rxdart.dart';

class BlocTransactionFirebase extends ChangeNotifier {
  final _repository = FirebaseExpenseRepository();
  List<TransactionsModel> expenseList = [];
  final _streamController =
      StreamController<List<TransactionsModel>>.broadcast();

  ReplaySubject<TransactionsModel> transactionModelStream =
      ReplaySubject<TransactionsModel>();

  Sink<List<TransactionsModel>> get input => _streamController.sink;
  Stream<List<TransactionsModel>> get output => _streamController.stream;

  double getTotalExpenses() {
    double totalExpenses = 0;
    if (expenseList.length > 0) {
      expenseList.forEach((element) {
        if (element.amount! != null && element.amount! < 0) {
          totalExpenses += element.amount ?? 0;
        }
      });
    }
    return totalExpenses;
  }

  // getTotalExpensesByMonth() {
  //   double totalExpenses = 0.0;
  //   if (expenseList != []) {
  //     expenseList.forEach((element) {
  //       if(element.date. < )
  //     });
  //   }
  // }

  getTotalIcomes() {
    double totalIncomes = 0;
    try {
      if (expenseList.length > 0) {
        expenseList.forEach((element) {
          if (element.amount! > 0) {
            totalIncomes += element.amount ?? 0.00;
          }
        });
      }
    } catch (e) {}
    // Functions.priceFormatter(totalIncomes);
    return totalIncomes;
  }

  getBalance() {
    double balance = 0;
    balance = (getTotalIcomes() + getTotalExpenses());
    return balance;
  }

  BlocTransactionFirebase() {
    getAllExpenses();

    _streamController.stream.listen((event) {
      expenseList = event;
      notifyListeners();
      //print(event.firstWhere((element) => element.amount! > 0));
    });

    //stream sink para histórico
    FirebaseExpenseRepository.litenList((event) {
      if (event.isNotEmpty) {
        _streamController.sink.add(event);
      }

      // FirebaseExpenseRepository.litenList((p0) {
      //   if (p0.isNotEmpty) {
      //     _streamController.sink.add(event);
      //   }
      // });

      // FirebaseExpenseRepository.litenList(
      //   (p0) {
      //     if (p0.isNotEmpty) {
      //       transactionModelStream.sink
      //           .add(p0.firstWhere((element) => element.amount! > 0));
      //     }
      //   },
      // );

      // notifyListeners();
    });
  }

  double formatValue(String value) {
    value.replaceAll('.', ',');
    return double.parse(value);
  }

  void addExpense({required TransactionsModel expense}) async {
    expenseList.add(await _repository.addExpense(expense: expense));
    _streamController.sink.add(expenseList);
  }

  void deleteExpense({required TransactionsModel transaction}) async {
    expenseList.remove(await _repository.delete(expense: transaction));
    input.add(expenseList);
  }

  getAllExpenses() async {
    expenseList = await _repository.getAllExpense();
    _streamController.add(expenseList);
  }

  GetAllExpensesByDate(
      {required DateTime initial, required DateTime finalDate}) async {
    expenseList = await _repository.getExpensesByMonth(
        initialDate: initial, finalDate: finalDate);
    _streamController.sink.add(expenseList);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
