import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/features/bottom_bar/education_page.dart';
import 'package:gasto_certo/app/features/bottom_bar/investing_page.dart';
import 'package:gasto_certo/app/features/bottom_bar/transactions_page.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_page.dart';

class HomeBottomBarPage extends StatefulWidget {
  const HomeBottomBarPage({this.user, super.key});
  final String? user;

  @override
  State<HomeBottomBarPage> createState() => _HomeBottomBarPageState();
}

class _HomeBottomBarPageState extends State<HomeBottomBarPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    const Investing(),
    const Transactions(),
    const EducationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.darkBlue,
            enableFeedback: true,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(color: AppColors.darkBlue),
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.greylight1,
            onTap: _onItemTapped,
            items: [
              // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.home), label: 'Investimentos'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.home), label: 'Transações'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.home), label: 'Educação'),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  color: AppColors.greylight,
                  width: 26,
                  height: 28,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/Bar.png',
                  width: 26,
                  height: 28,
                ),
                label: 'Investimentos',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/wallet.png',
                  width: 28,
                  height: 30,
                ),
                label: 'Transações',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/financeiro.png',
                  color: AppColors.greylight1,
                  width: 26,
                  height: 28,
                ),
                label: 'Educação',
              ),
            ]),
      ),
    );
  }
}
