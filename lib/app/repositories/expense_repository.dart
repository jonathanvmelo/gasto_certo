import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/data/dataBase/db.dart';
import 'package:gasto_certo/app/data/models/transaction_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ExpenseRepository extends ChangeNotifier {
  DBProvider dbProvider = DBProvider();

  // Future<List<ExpenseModelSqflite>> getAll() async {
  //   var db = await dbProvider.db;
  //   List<ExpenseModelSqflite> itens = [];
  //   var data = await db.query('despesa');
  //   for (var item in data) {
  //     itens.add(ExpenseModelSqflite.fromMap(item));
  //   }
  //   return itens;
  // }

  fetchExpenses() async {
    var db = await dbProvider.db;
    List<TransactionsModel> itens = [];
    var data = await db.query('transactions');
    data.forEach((element) {
      itens.add(TransactionsModel.fromMap(element));
    });
    return itens;
  }

  Future<TransactionsModel> addExpenseBatch(
      {required TransactionsModel item}) async {
    var db = await dbProvider.db;
    await db.transaction((txn) async {
      Batch batch = txn.batch();
      try {
        batch.insert('transactions', item.toJson());
      } catch (e) {
        log(e.toString());
      }
      await batch.commit(noResult: true);
    });
    return item;
  }

  addExpense({required TransactionsModel item}) async {
    var db = await dbProvider.db;
    try {
      await db.insert('transactions', item.toJson());
    } catch (e) {
      log(e.toString());
    }
    return item;
  }

  deleteExpense({required TransactionsModel item}) async {
    var db = await dbProvider.db;
    await db.transaction((txn) async {
      Batch batch = txn.batch();
      try {
        batch.delete('transactions', where: 'id = ?', whereArgs: [item.id]);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}

// class ExpenseSync {
//   DBProvider dbProvider = DBProvider();
//   final _repository = FirebaseExpenseRepository();
//   import() async {
//     List<ExpenseModel> list = [];
//     list = await _repository.getAllExpense();
//     var db = await dbProvider.db;
//     try {
//       list.forEach((element) async {
//         await db.insert('despesa', element.toJson());
//       });
//     } catch (e) {}
//   }
// }
