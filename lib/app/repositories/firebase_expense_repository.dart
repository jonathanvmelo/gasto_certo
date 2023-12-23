import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gasto_certo/app/data/models/transaction_model.dart';

typedef NotifyRepositoryOnGetUpdatedList = void Function(
    List<TransactionsModel>);

class FirebaseExpenseRepository {
  // ignore: unused_field
  final CollectionReference _expenseCollection =
      FirebaseFirestore.instance.collection('despesas');

  Future<TransactionsModel> addExpense(
      {required TransactionsModel expense}) async {
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection('despesas')
        .add(expense.toJson());

    expense.id = documentReference.id;
    return expense;
  }

  Future<TransactionsModel> delete({required TransactionsModel expense}) async {
    try {
      if (expense.id != "") {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection('despesas')
            .doc(expense.id);

        await documentReference.delete();
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return expense;
  }

  Future<List<TransactionsModel>> getAllExpense() async {
    List<TransactionsModel> expenses = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('despesas')
          .orderBy('amount', descending: false)
          .get();

      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        expenses.add(TransactionsModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
    } catch (e) {
      log(e.toString());
    }
    return expenses;
  }

  Future<List<TransactionsModel>> getExpensesByMonth(
      {required DateTime initialDate, required DateTime finalDate}) async {
    List<TransactionsModel> list = [];
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('despesas');

      QuerySnapshot querySnapshot = await collectionReference
          .where('date',
              isGreaterThanOrEqualTo: initialDate,
              isLessThanOrEqualTo: finalDate)
          .get();
      querySnapshot.docs.forEach((element) {
        list.add(TransactionsModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
    } catch (e) {
      log(e.toString());
    }
    return list;
  }

  static void litenList(NotifyRepositoryOnGetUpdatedList onGetUpdatedList) {
    FirebaseFirestore.instance
        .collection('despesas')
        .snapshots()
        .listen((event) {
      List<TransactionsModel> list = [];
      try {
        // ignore: avoid_function_literals_in_foreach_calls
        event.docs.forEach((element) {
          var result = TransactionsModel.fromJson(element.data(), element.id);
          list.add(result);
        });
        onGetUpdatedList(list);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
