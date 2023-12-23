// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gasto_certo/app/data/models/transaction_model.dart';

abstract class TransactionsState {
  final List<TransactionsModel> expensiveList;
  TransactionsState({
    required this.expensiveList,
  });
}

class TransactionsStateInitial extends TransactionsState {
  TransactionsStateInitial() : super(expensiveList: []);
}

class TransactionsStateLoading extends TransactionsState {
  TransactionsStateLoading() : super(expensiveList: []);
}

class TransactionsStateSuccess extends TransactionsState {
  TransactionsStateSuccess({required List<TransactionsModel> list})
      : super(expensiveList: list);
}

class TransactionsStateEmpty extends TransactionsState {
  TransactionsStateEmpty() : super(expensiveList: []);
}

class TransactionsStateError extends TransactionsState {
  final String message;
  TransactionsStateError({
    required this.message,
  }) : super(expensiveList: []);
}
