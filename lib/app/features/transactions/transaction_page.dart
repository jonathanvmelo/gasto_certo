// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }

  categories() {
    data.map((e) => (e) => ListTile(
          title: Text(e.toString()),
        ));
  }

  List<Expense> data = [
    Expense(
        icon: Icons.badge, description: 'Mercado ', operation: Operation.debit)
  ];
}

class Expense {
  IconData icon;
  Color? iconColor;
  String description;
  Operation operation;
  Expense({
    required this.icon,
    this.iconColor,
    required this.description,
    required this.operation,
  });
}

enum Operation { debit, credit, transfer }
