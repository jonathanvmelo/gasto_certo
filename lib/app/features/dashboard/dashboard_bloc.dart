import 'dart:async';

import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_event.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_state.dart';
import 'package:gasto_certo/app/repositories/firebase_expense_repository.dart';

class DashboardBloc {
  final _transactionRepository = FirebaseExpenseRepository();

  final StreamController<DashboardEvent> _input = StreamController();
  final StreamController<DashboardState> _output = StreamController.broadcast();

  Sink<DashboardEvent> get input => _input.sink;
  Stream<DashboardState> get output => _output.stream;

  DashboardBloc() {
    _input.stream.listen(_mapeventTOState);
  }

  void _mapeventTOState(DashboardEvent event) async {
    List<ExpenseModel> expensives = [];

    _output.add(DashboardStateLoading());

    if (event is GetDashboardTransiction) {
      expensives = await _transactionRepository.getAllExpense();
    }
    // if(event is PostTransaction){
    //   expensives = _transactionRepository.addExpense(expense: expense)
    // }

    _output.add(DashboardStateSuccess(list: expensives));
  }
}
