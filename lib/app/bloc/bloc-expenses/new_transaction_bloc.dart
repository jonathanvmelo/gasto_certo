// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:gasto_certo/app/data/models/expense_model.dart';
// import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';

// class NewTransactionBloc extends ChangeNotifier {
//   final _transactionRepository = FirebaseExpenseRepository();

//   final StreamController _streamController = StreamController.broadcast();

//   Stream get outputStream => _streamController.stream;
//   Sink get inputStream => _streamController.sink;

//   List<ExpenseModel> listaTransacoes = [];

//   NewTransactionBloc() {
//     _streamController.stream.listen((event) async {
//       // Adiciona uma despesa
//       await _transactionRepository.addExpense(expense: event);

//       // Obtém todas as despesas após a adição
//       List<ExpenseModel> allExpenses =
//           await _transactionRepository.getAllExpense();

//       // Adiciona a lista atualizada ao stream
//       _streamController.sink.add(allExpenses);

//       // Log do evento (certifique-se de que event seja uma string ou algo que possa ser convertido para string)
//       log(event.toString());
//     });
//   }

//   // Certifique-se de fechar o StreamController quando não for mais necessário
//   void dispose() {
//     _streamController.close();
//     super.dispose();
//   }
// }
