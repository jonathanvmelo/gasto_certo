// import 'dart:async';
// import 'dart:developer';

// import 'package:gasto_certo/app/data/models/expense_model.dart';
// import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';
// import 'package:rxdart/rxdart.dart';

// class ExampleSimpleBloc {
//   final _repository = FirebaseExpenseRepository();
//   final _notificacaoController = BehaviorSubject<List<ExpenseModel>>();
//   final _totalController = BehaviorSubject<int>();

//   Stream<List<ExpenseModel>> get notificacaoStream =>
//       _notificacaoController.stream;

//   Stream<int> get totalStream => _totalController.stream;
//   Sink get inputEvent => _notificacaoController.sink;

//   int get total => _totalController.value ?? 0;

//   ExampleSimpleBloc() {
//     _init();
//   }

//   void _init() async {
//     try {
//       List<ExpenseModel> notificacoes = await _repository.getAllExpense();
//       if (notificacoes.length > 0) {
//         _updateTotal(notificacoes);
//       }
//       _notificacaoController.sink.add(notificacoes);
//     } catch (e) {
//       log('Erro ao carregar notificações: $e');
//     }
//   }

//   void _updateTotal(List<ExpenseModel> notificacoes) {
//     int total = notificacoes.where((element) => element.date == 0).length;
//     _totalController.sink.add(total);
//   }

//   void updateNotificacoes() async {
//     try {
//       List<ExpenseModel> notificacoes = await _repository.getAllExpense();
//       _updateTotal(notificacoes);
//       _notificacaoController.sink.add(notificacoes);
//     } catch (e) {
//       log('Erro ao atualizar notificações: $e');
//     }
//   }

//   void dispose() {
//     _notificacaoController.close();
//     _totalController.close();
//   }

//   void addNotificacao(ExpenseModel notificacao) async {
//     await _repository.addExpense(expense: notificacao);
//     updateNotificacoes();
//   }

//   void deleteNotificacao(ExpenseModel notificacao) async {
//     await _repository.delete(expense: notificacao);
//     updateNotificacoes();
//   }
// }
