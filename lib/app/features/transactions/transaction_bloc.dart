import 'dart:async';

import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/features/transactions/transaction_event.dart';
import 'package:gasto_certo/app/features/transactions/transaction_state.dart';
import '../../repositories/firebase_expense_repository.dart';

class TransactionBloc {
  final _transactionRepository = FirebaseExpenseRepository();

  final StreamController<TransactionEvent> _inputTransactionController =
      StreamController();

  final StreamController<TransactionState> _outputTransactionController =
      StreamController();

  Sink<TransactionEvent> get inputTransaction =>
      _inputTransactionController.sink;

  Stream<TransactionState> get outputTransaction =>
      _outputTransactionController.stream;

  TransactionBloc() {
    _inputTransactionController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TransactionEvent event) async {
    List<ExpenseModel> expensives = [];

    _outputTransactionController.add(TransactionStateLoading());

    if (event is GetTransaction) {
      expensives = await _transactionRepository.getAllExpense();
    } else if (event is PostTransaction) {
      expensives.add(
          await _transactionRepository.addExpense(expense: event.transacao));
    } else if (event is DeleteTransaction) {
      expensives.remove(
          await _transactionRepository.delete(expense: event.transacao));
    }

    _outputTransactionController.add(TransactionStateSuccess(list: expensives));
  }
}
