// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gasto_certo/app/data/models/expense_model.dart';

abstract class TransactionState {
  final List<ExpenseModel> expensiveList;
  TransactionState({
    required this.expensiveList,
  });
}

class TransactionStateInitial extends TransactionState {
  TransactionStateInitial() : super(expensiveList: []);
}

class TransactionStateLoading extends TransactionState {
  TransactionStateLoading() : super(expensiveList: []);
}

class TransactionStateSuccess extends TransactionState {
  TransactionStateSuccess({required List<ExpenseModel> list})
      : super(expensiveList: list);
}

class TransactionStateEmpty extends TransactionState {
  TransactionStateEmpty() : super(expensiveList: []);
}

class TransactionStateError extends TransactionState {
  final String message;
  TransactionStateError({
    required this.message,
  }) : super(expensiveList: []);
}
