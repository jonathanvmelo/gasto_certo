// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();

  int currentPage = 0;

  List<Widget> childrens = [];

  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat();
        return;
      }
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
        return;
      }
    });
    animation = Tween<double>(begin: 0, end: 300).animate(_animationController);
    _animationController.forward();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
    childrens = [child_01(), child_02(), child_03()];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          "https://i.stack.imgur.com/joGPS.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size(100, 200),
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Text(
                  'Gasto Certo',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.mediumText26
                      .copyWith(color: AppColors.white),
                )

                // Image.asset(
                //   'assets/images/logo.png',
                //   filterQuality: FilterQuality.high,
                //   width: MediaQuery.of(context).size.width * 0.5,
                // ),
                ),
          ),
          body: _body(),
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 40),
            color: AppColors.transparent,
            child: PageView(
              controller: _pageController,
              children: childrens,
            ),
          ),
        ),
        Container(
          color: AppColors.transparent,
          padding:
              const EdgeInsets.only(left: 4.0, right: 4.0, top: 30, bottom: 30),
          //height: 208.0 + MediaQuery.of(context).padding.bottom,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: spread(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: PrimaryButton(
                  textButton: 'Criar uma conta',
                  color: AppColors.darkBlue,
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/signUp');
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já tem uma conta?',
                    style: TextStyle(color: AppColors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Fazer login',
                      style: TextStyle(color: AppColors.darkBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> spread() {
    if (mounted) {
      return List.generate(
        childrens.length,
        (index) => Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color:
                currentPage == index ? AppColors.darkBlue : AppColors.greylight,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 6,
          width: currentPage == index ? 40 : 20,
        ),
      );
    } else {
      return [];
    }
  }

  Widget child_03() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image.asset('assets/icons/Moneyverse Business Analytics.png'),
          Text(
            'Organize suas contas e comece a poupar hoje mesmo',
            style: AppTextStyle.mediumText22.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget child_02() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/Moneyverse Business Balance.png'),
          Text(
            'Crie um plano para atingir seus objetivos financeiros',
            style: AppTextStyle.mediumText26.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Acompanhe a evolução mensal dos seus gastos e domine suas finanças',
            style: AppTextStyle.smallText16.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget child_01() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Image.asset('assets/icons/Moneyverse Buy Online.png'),
          Text(
            'Todas suas contas em um só lugar',
            style: AppTextStyle.mediumText22.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
