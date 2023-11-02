// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/appLists.dart';
import 'package:gasto_certo/app/data/mocks/mock_expense.dart';
import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/services/secury_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:core';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  String? user;
  DashboardPage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _mesAtual = 10;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    // ignore: unused_local_variable
    String currentMonth = getMonth(now);
    user = getUser();
    _data = getData();
  }

  // ignore: prefer_typing_uninitialized_variables
  var _data;
  getData() async {
    data;
  }

  // ignore: prefer_typing_uninitialized_variables
  var user;

  final sessonUser = const SecureStorage();
  getUser() async {
    await sessonUser.readOne(key: 'CURRENT_USER');
  }

  void _previousMonth() {
    setState(() {
      _mesAtual = (_mesAtual - 1) % 12;
    });
  }

  void _nextMonth() {
    setState(() {
      _mesAtual = (_mesAtual + 1) % 12;
    });
  }

  String getMonth(DateTime dateTime) {
    // Lista dos meses do ano

    // Obtém o índice do mês na lista mesesDoAno
    int monthIndex = dateTime.month - 1;

    // Retorna o nome do mês com base no índice
    return MOUNTHS[monthIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      drawer: const Drawer(
        backgroundColor: AppColors.darkBlue,
        elevation: 3,
        surfaceTintColor: AppColors.grey,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundColor: AppColors.grey, child: Text('J')),
                decoration: BoxDecoration(),
                accountName: Text('Jonathan'),
                accountEmail: Text('jonatha@hotmail.com')),
            Divider(
              color: AppColors.grey,
              thickness: 1,
              height: 2,
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.darkBlue),
        elevation: 0,
        backgroundColor: AppColors.iceWhite,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: _data,
            builder: (context, snapshot) => Column(
              children: [
                mounthSwith(),
                // CustomMounthListTileWidget(),
                Text(
                  'Saldo atual de --',
                  style: AppTextStyle.mediumText18
                      .copyWith(color: AppColors.darkBlue),
                ),
                Text(
                  'R\$ 500,00',
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.darkBlue),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up,
                            color: AppColors.green,
                            size: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Receitas'),
                              Text(
                                'R\$ 1.500,00',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_down_outlined,
                            color: AppColors.red,
                            size: 40,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Receitas'),
                              Text(
                                'R\$ 1.000,00',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                chart(),
                Container(
                  //height: MediaQuery.of(context).size.height * .55,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Card(
                    child: Column(
                      children: [
                        Column(
                          children: categories(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  chart() {
    return SizedBox(
      height: 180,
      child: SfCircularChart(
        palette: const [
          Color(0xff7A80FF),
          Color(0xff6AC394),
          Color(0xff7EE2F8),
          Color(0xffF49FEC),
        ],
        series: <DoughnutSeries<ExpenseModel, String>>[
          DoughnutSeries<ExpenseModel, String>(
            dataSource: data,
            xValueMapper: (ExpenseModel data, _) => data.description,
            yValueMapper: (ExpenseModel data, _) => data.amount,
            // dataLabelSettings:
            //     const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  List<Widget> categories() {
    double totalAmount = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((element) {
      totalAmount += element.amount!;
    });

    return data.map((e) {
      String text = 'transações';
      if (e.transactions == 1) {
        text = text.replaceAll('ções', 'ção');
      }

      return ListTile(
        leading: Icon(
          Icons.abc,
          size: 30,
          color: Color(e.iconColor!),
        ),
        title: Text(e.description!, style: AppTextStyle.mediumText18),
        subtitle: Text(
          '${(e.amount! / totalAmount * 100).toStringAsFixed(1)}% - ${e.transactions!.round()} $text',
          style: AppTextStyle.smallText,
        ),
        trailing: Text('R\$  ${e.amount!.toStringAsFixed(2).toString()}',
            style: AppTextStyle.mediumText18),
      );
    }).toList();
  }

  mounthSwith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.arrow_left), onPressed: _previousMonth),
        Text(
          MOUNTHS[_mesAtual],
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: _nextMonth,
          icon: const Icon(Icons.arrow_right),
        )
      ],
    );
  }
}
