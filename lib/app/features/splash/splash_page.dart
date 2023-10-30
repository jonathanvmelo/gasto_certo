import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed('/signIn'),
    );

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
