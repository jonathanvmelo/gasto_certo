import 'package:gasto_certo/app/data/models/transaction_model.dart';

abstract class TransactionEvent {}

class GetAllExpenses extends TransactionEvent {
  List<TransactionsModel> expenses;
  GetAllExpenses({
    required this.expenses,
  });
}

class PostTransaction extends TransactionEvent {
  final TransactionsModel transacao;

  PostTransaction({required this.transacao});
}

class DeleteTransaction extends TransactionEvent {
  final TransactionsModel transacao;

  DeleteTransaction({required this.transacao});
}
