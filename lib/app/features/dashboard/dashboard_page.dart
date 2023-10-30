// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/widgets/custom_list_tile_mounth.dart';
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
  List<String> mesesDoAno = [];
  @override
  void initState() {
    super.initState();

    mesesDoAno = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];
    DateTime now = DateTime.now();
    String currentMonth = getMonth(now);
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
    return mesesDoAno[monthIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mounthSwith(),
                  // CustomMounthListTileWidget(),
                  Text(
                    'Saldo atual',
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
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                child: Column(
                  children: [
                    chart(),
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
        series: <DoughnutSeries<_Expense, String>>[
          DoughnutSeries<_Expense, String>(
            dataSource: data,
            xValueMapper: (_Expense data, _) => data.category,
            yValueMapper: (_Expense data, _) => data.amount,
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
      totalAmount += element.amount;
    });
    return data.map((e) {
      return ListTile(
        leading: Icon(e.icon, size: 24, color: e.color),
        title: Text(e.category, style: AppTextStyle.mediumText18),
        subtitle: Text(
          '${(e.amount / totalAmount * 100).toStringAsFixed(0)}% - ${e.transactions} transação(s)',
          style: AppTextStyle.smallText,
        ),
        trailing: Text('R\$  ${e.amount.toString()}',
            style: AppTextStyle.mediumText18),
      );
    }).toList();
  }

  mounthSwith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(Icons.arrow_left), onPressed: _previousMonth),
        Text(
          mesesDoAno[_mesAtual],
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: _nextMonth,
          icon: Icon(Icons.arrow_right),
        )
      ],
    );
  }

  List<_Expense> data = [
    _Expense('Compras online', 500, 3, Icons.shop, const Color(0xFF2196F3)),
    _Expense('Mercado', 1200, 4, Icons.shopping_cart, const Color(0xFF4CAF50)),
    _Expense('Lazer', 650, 7, Icons.sports_soccer, Colors.teal),
    _Expense('Investimento', 1000, 1, Icons.attach_money, Colors.purple),
  ];
}

class _Expense {
  _Expense(
      this.category, this.amount, this.transactions, this.icon, this.color);
  final IconData icon;
  final String category;
  final double amount;
  final double transactions;
  final Color color;
}
