// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_transaction_firebase.dart';
import 'package:gasto_certo/app/common/enums/enum_categories.dart';
import 'package:gasto_certo/app/data/models/transaction_model.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_home.dart';
import 'package:intl/intl.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:gasto_certo/app/features/education/education_page.dart';
import 'package:gasto_certo/app/features/investing/investing_page.dart';
import 'package:provider/provider.dart';

class CustomPageViewPage extends StatefulWidget {
  final User? user;
  const CustomPageViewPage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<CustomPageViewPage> createState() => _CustomPageViewPageState();
}

class _CustomPageViewPageState extends State<CustomPageViewPage> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      // log(_pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          DashboardHome(controller: _pageController),
          const EducationPage(),
          const InvestingPage(),
          const InvestingPage(),
          //NewTransactionsPage()
          //const TransactionsPage()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.grey,
        onPressed: () {
          final now = DateTime.now();
          log(now.toString());
          //Teste adiciona tarefa
          Provider.of<BlocTransactionFirebase>(context).addExpense(
              expense: TransactionsModel(
                  category: Categories.alimentacao,
                  amount: -18.00,
                  description: 'Almoço',
                  id: '151',
                  date: '18/12/2023'));

          // Obtém o fuso horário local

          // Formata a data e hora no fuso horário local
          final formattedDate = DateFormat.yMd().format(now.toLocal());
          final formattedTime = DateFormat.jm().format(now.toLocal());

          log('Data: $formattedDate');
          log('Hora: $formattedTime');

          final formattedDateTime =
              DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now().toLocal());

          log('Data e hora: $formattedDateTime');
        },
        child: const Icon(
          Icons.add,
          color: AppColors.orange,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        controller: _pageController,
        selectedItemColor: AppColors.greyDark,
        children: [
          CustomBottomAppBarItem(
              label: 'Home',
              onPressed: () => _pageController.jumpToPage(0),
              primaryIcon: Icons.home,
              secondaryIcon: Icons.home_outlined),
          CustomBottomAppBarItem(
              label: 'Carteira',
              onPressed: () => _pageController.jumpToPage(1),
              primaryIcon: Icons.bar_chart_sharp,
              secondaryIcon: Icons.bar_chart_sharp),
          CustomBottomAppBarItem(
              label: 'Carteira',
              onPressed: () => _pageController.jumpToPage(2),
              primaryIcon: Icons.wallet,
              secondaryIcon: Icons.wallet_outlined),
          CustomBottomAppBarItem(
              label: 'Carteira',
              onPressed: () => _pageController.jumpToPage(3),
              primaryIcon: Icons.person,
              secondaryIcon: Icons.person_outline),
        ],
      ),
    );
  }
}
