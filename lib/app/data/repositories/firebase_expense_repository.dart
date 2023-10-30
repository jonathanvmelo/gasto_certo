import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gasto_certo/app/data/models/expense_model.dart';

typedef NotifyRepositoryOnGetUpdatedList = void Function(List<ExpenseModel>);

class FirebaseExpenseRepository {
  static Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection('despesas')
        .add(expense.toJson());

    expense.id = documentReference.id;
    return expense;
  }

  static Future<List<ExpenseModel>> getAllExpense() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('despesas').get();
    List<ExpenseModel> expenses = [];

    // ignore: avoid_function_literals_in_foreach_calls
    querySnapshot.docs.forEach((element) {
      expenses.add(ExpenseModel.fromJson(
          element.data() as Map<String, dynamic>, element.id));
    });

    return expenses;
  }

  static void litenList(NotifyRepositoryOnGetUpdatedList onGetUpdatedList) {
    FirebaseFirestore.instance
        .collection('despesas')
        .snapshots()
        .listen((event) {
      List<ExpenseModel> list = [];
      try {
        // ignore: avoid_function_literals_in_foreach_calls
        event.docs.forEach((element) {
          var result = ExpenseModel.fromJson(element.data(), element.id);
          list.add(result);
        });
        onGetUpdatedList(list);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
