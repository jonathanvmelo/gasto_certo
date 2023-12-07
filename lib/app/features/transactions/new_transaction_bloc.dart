import 'dart:async';

import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/features/transactions/transaction_state.dart';
import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';

class NewTransactionBloc {
  final _transactionRepository = FirebaseExpenseRepository();
  final _streamController = StreamController<TransactionState>.broadcast();
  Stream get outputStream => _streamController.stream;

  List<ExpenseModel> expensives = [];

  NewTransactionBloc() {
    _streamController.stream.listen(_mapEventToState);

    _streamController.stream.listen((event) async {
      try {
        List<ExpenseModel> listaAux =
            await _transactionRepository.getAllExpense();
        expensives = listaAux;
        _streamController.sink.add(TransactionStateSuccess(list: expensives));
      } catch (e) {
        _streamController.sink.addError('Erro $e');
      }
    });
  }

  void _mapEventToState(dynamic event) async {
    try {
      List<ExpenseModel> expenses =
          await _transactionRepository.getAllExpense();
      _streamController.sink.add(TransactionStateSuccess(list: expenses));
    } catch (e) {
      _streamController.sink.addError('Erro $e');
    }
  }

  void dispose() {
    _streamController.close();
  }
}
