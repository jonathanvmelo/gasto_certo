// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_expenses.dart';
// import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_sqflite_expense.dart';
// import 'package:gasto_certo/app/common/constants/app_colors.dart';
// import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
// import 'package:gasto_certo/app/data/models/transaction_model.dart';
// import 'package:gasto_certo/app/data/models/expense_model_sqflite.dart';

// class NewTransactionsPage extends StatelessWidget {
//   final expenseController = TextEditingController();
//   final amountController = TextEditingController();
//   final dateController = TextEditingController();
//   final iconColorController = TextEditingController();

//   final bloc = BlocTransaction();
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () async {},
//       child: Scaffold(
//         appBar: AppBar(
//           // leading:
//           //     IconButton(onPressed: null, icon: Icon(Icons.food_bank_outlined)),
//           backgroundColor: AppColors.darkBlue,
//           toolbarHeight: 80,
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'New Transações',
//               style: AppTextStyle.mediumText.copyWith(color: AppColors.white),
//             ),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.notification_add))
//           ],
//         ),
//         body: StreamBuilder(
//           stream: bloc.outputExpense,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: Text('Sem dados'),
//               );
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Container(
//                     decoration: const BoxDecoration(boxShadow: []),
//                     child: Text('Error: ${snapshot.error}')),
//               );
//             }

//             // List<ExpenseModel> expenses = snapshot.data!.expensiveList;

//             return Container(
//               height: 500,
//               margin: const EdgeInsets.only(bottom: 0),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   final item = snapshot.data[index];
//                   final color =
//                       item.amount!.isNegative ? AppColors.red : AppColors.green;
//                   // final value = item. % 2 == 0
//                   //     ? "+ R\$ 150,00"
//                   //     : "- R\$ 100,00";
//                   return Slidable(
//                     endActionPane:
//                         ActionPane(motion: const BehindMotion(), children: [
//                       SlidableAction(
//                         flex: 2,
//                         onPressed: (context) {
//                           bloc.deleteExpense(expense: item);
//                         },
//                         backgroundColor: AppColors.red,
//                         foregroundColor: Colors.white,
//                         icon: Icons.delete,
//                       ),
//                       SlidableAction(
//                         flex: 2,
//                         onPressed: doNothing,
//                         backgroundColor: AppColors.greylight,
//                         foregroundColor: Colors.white,
//                         icon: Icons.cancel,
//                       ),
//                     ]),
//                     child: ListTile(
//                       leading: Text(item.description ?? ""),
//                       trailing: Text(item.amount!.toString()),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Adicione uma despesa quando o botão for pressionado
//             bloc.inputExpense.add(TransactionsModel(
//                 description: 'Teste Novo', date: DateTime.now(), expense: 200));
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   clean() {
//     expenseController.text = '';
//     amountController.text = '';
//   }

//   lisTile({
//     required IconData icon,
//     int? iconColor,
//     required String description,
//     String? amount,
//     required String date,
//   }) {
//     return Card(
//       margin: const EdgeInsets.all(15),
//       child: Slidable(
//         endActionPane: ActionPane(motion: const BehindMotion(), children: [
//           SlidableAction(
//             flex: 2,
//             onPressed: (context) {},
//             backgroundColor: AppColors.red,
//             foregroundColor: Colors.white,
//             icon: Icons.delete,
//           ),
//           SlidableAction(
//             flex: 2,
//             onPressed: doNothing,
//             backgroundColor: AppColors.greylight,
//             foregroundColor: Colors.white,
//             icon: Icons.cancel,
//           ),
//         ]),
//         child: ListTile(
//           leading: Icon(icon, color: Colors.red),
//           title: Text(
//             description,
//             style: AppTextStyle.mediumText18,
//           ),
//           trailing: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 date,
//                 style: AppTextStyle.smallText14,
//               ),
//               Text(amount ?? "", style: AppTextStyle.mediumText18),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void doNothing(BuildContext context) {}
// }
