import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/data/repositories/firebase_expense_repository.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final expenseController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final iconColorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (mounted) await FirebaseExpenseRepository.getAllExpense();
      },
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: null, icon: Icon(Icons.food_bank_outlined)),
          backgroundColor: AppColors.darkBlue,
          toolbarHeight: 80,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Transações'),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add))
          ],
        ),
        body: FutureBuilder(
          future: FirebaseExpenseRepository.getAllExpense(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<ExpenseModel> expenses = snapshot.data as List<ExpenseModel>;
              return ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return lisTile(
                      icon: Icons.shop,
                      iconColor: expenses[index].iconColor,
                      description: expenses[index].description!,
                      amount: expenses[index].amount.toString(),
                      date: expenses[index].date!);

                  // ListTile(
                  //   leading: Text(messages[index].message),
                  //   title: Text(messages[index].date),
                  // );
                },
              );
            }
          },
        ),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniEndDocked,
        // floatingActionButton: FloatingActionButton.small(
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) => SizedBox(
        //         height: 300,
        //         child: AlertDialog(
        //           actionsOverflowButtonSpacing: 10,
        //           title: const Text('Adicione uma despesa'),
        //           actions: [
        //             TextField(
        //               controller: expenseController,
        //               decoration: const InputDecoration(
        //                   label: Text('Despesa'), border: OutlineInputBorder()),
        //             ),
        //             TextField(
        //               controller: dateController,
        //               decoration: const InputDecoration(
        //                   label: Text('Data'), border: OutlineInputBorder()),
        //             ),
        //             TextField(
        //               controller: iconColorController,
        //               decoration: const InputDecoration(
        //                   label: Text('Cor do icone'),
        //                   border: OutlineInputBorder()),
        //             ),
        //             TextField(
        //               controller: amountController,
        //               decoration: const InputDecoration(
        //                   label: Text('valor'), border: OutlineInputBorder()),
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 ElevatedButton(
        //                   onPressed: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: const Text('Cancelar'),
        //                 ),
        //                 ElevatedButton(
        //                   onPressed: () {
        //                     FirebaseExpenseRepository.addExpense(
        //                       ExpenseModel(
        //                           iconColor: int.parse(
        //                             iconColorController.text,
        //                           ),
        //                           description: expenseController.text,
        //                           date: dateController.text,
        //                           amount: amountController.text),
        //                     );
        //                     log(DateTime.now().toString());
        //                     clean();
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: const Text('Adicionar'),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //     // customModalBottomSheet(context, buttonText: 'Adicione uma despesa');
        //     //FirebaseRepository.addMessage(messageModel)
        //   },
        //   backgroundColor: AppColors.darkBlue,
        //   child: const Icon(
        //     Icons.add,
        //     color: AppColors.white,
        //   ),
        // ),
      ),
    );
  }

  clean() {
    expenseController.text = '';
    amountController.text = '';
  }

  lisTile({
    required IconData icon,
    int? iconColor,
    required String description,
    required String amount,
    required String date,
  }) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: ListTile(
        leading: Icon(icon, color: Color(iconColor!)),
        title: Text(
          description,
          style: AppTextStyle.mediumText18,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: AppTextStyle.smallText,
            ),
            Text(amount.toString(), style: AppTextStyle.mediumText18),
          ],
        ),
      ),
    );
  }
}
