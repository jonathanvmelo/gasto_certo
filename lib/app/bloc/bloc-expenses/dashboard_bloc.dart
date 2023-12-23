// import 'dart:async';

// import 'package:gasto_certo/app/data/models/expense_model.dart';
// import 'package:gasto_certo/app/features/dashboard/dashboard_event.dart';
// import 'package:gasto_certo/app/features/dashboard/dashboard_state.dart';
// import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';

// class DashboardBloc {
//   //final _transactionRepository = FirebaseExpenseRepository();
//   double _saldo = 0;
//   double get saldo => _saldo;

//   double _totalReceitas = 0;
//   double get totalReceitas => _totalReceitas;

//   double _totalDespesas = 0;
//   double get totalDespesas => _totalDespesas;
//   final StreamController<DashboardEvent> _input = StreamController();
//   final StreamController<DashboardState> _output = StreamController.broadcast();

//   Sink<DashboardEvent> get input => _input.sink;
//   Stream<DashboardState> get output => _output.stream;

//   DashboardBloc() {
//     _input.stream.listen(_mapeventTOState);
//   }

//   _mapeventTOState(DashboardEvent event) async {
//     List<ExpenseModel> expensives = [];
//     try {
//       _output.add(DashboardStateLoading());

//       if (event is GetAllTransactions) {
//         expensives = await _transactionRepository.getAllExpense();
//         expensives.forEach((element) {
//           _saldo += element.amount!;
//           if (element.amount!.isNegative) {
//             _totalDespesas += element.amount!;
//           } else {
//             _totalReceitas += element.amount!;
//           }
//         });
//       }
//       if (event is PostTransaction) {
//         expensives.add(
//             await _transactionRepository.addExpense(expense: event.expense));
//         _saldo += event.expense.amount!;
//         // expensives = await _transactionRepository.getAllExpense();
//       }
//       if (event is DeleteTransaction) {
//         await _transactionRepository.delete(expense: event.expense);
//         _saldo -= event.expense.amount!;
//         //expensives = await _transactionRepository.getAllExpense();
//         // expensives =
//         //     await _transactionRepository.delete(expense: event.expense);
//       }
//       _output.add(DashboardStateSuccess(list: expensives));
//     } catch (e) {
//       _output.addError(e);
//     } finally {
//       _output.add(DashboardStateSuccess(list: expensives));
//     }
//   }
// }
