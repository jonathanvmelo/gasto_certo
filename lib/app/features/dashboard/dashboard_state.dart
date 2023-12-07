// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gasto_certo/app/data/models/expense_model.dart';

abstract class DashboardState {
  List<ExpenseModel> transactionList;
  DashboardState({
    required this.transactionList,
  });
}

class DashboardStateInitial extends DashboardState {
  DashboardStateInitial() : super(transactionList: []);
}

class DashboardStateLoading extends DashboardState {
  DashboardStateLoading() : super(transactionList: []);
}

class DashboardStateSuccess extends DashboardState {
  final List<ExpenseModel> list;
  DashboardStateSuccess({required this.list}) : super(transactionList: list);
}

class DashboardStateError extends DashboardState {
  final String message;
  DashboardStateError({
    required this.message,
  }) : super(transactionList: []);
}
