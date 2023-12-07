import 'package:gasto_certo/app/data/models/expense_model.dart';

abstract class TransactionEvent {}

class GetTransaction extends TransactionEvent {}

class PostTransaction extends TransactionEvent {
  final ExpenseModel transacao;

  PostTransaction({required this.transacao});
}

class DeleteTransaction extends TransactionEvent {
  final ExpenseModel transacao;

  DeleteTransaction({required this.transacao});
}
