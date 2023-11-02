import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/features/splash/splash_controller.dart';
import 'package:gasto_certo/app/features/splash/splash_state.dart';
import 'package:gasto_certo/app/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = getIt.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSuccess) {
        Navigator.of(context).pushReplacementNamed('/homeBottomBar');
        log('if');
        log('if');
      } else {
        log('else');
        Navigator.of(context).popAndPushNamed('/signIn');
      }
    });

    // Future.wait([PrefsService.isAuth()]).then((value) => value[0]
    //     ? Navigator.of(context).pushReplacementNamed('/home')
    //     : Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     AppColors.darkBlue,
          //     AppColors.ligthBlue,
          //   ],
          // ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png', width: 222),

          // Text(
          //   "",
          //   style: AppTextStyle.bigText.copyWith(color: AppColors.white),
          // ),
        ),
      ),
    );
  }
}
