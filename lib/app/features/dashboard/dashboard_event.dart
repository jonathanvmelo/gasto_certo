import 'package:gasto_certo/app/data/models/expense_model.dart';

abstract class DashboardEvent {}

class GetDashboardTransiction extends DashboardEvent {}

class PostTransaction extends DashboardEvent {
  final ExpenseModel;
  PostTransaction({required this.ExpenseModel});
}

class DeleteTransaction extends DashboardEvent {
  final ExpenseModel;
  DeleteTransaction({required this.ExpenseModel});
}
