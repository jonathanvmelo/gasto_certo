import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/themes/default_theme.dart';
import 'package:gasto_certo/app/features/bottom_bar/home_bottom_bar_page.dart';
import 'package:gasto_certo/app/features/forgot_password/forgot_password_page.dart';
import 'package:gasto_certo/app/features/home/pages/home_page.dart';
import 'package:gasto_certo/app/features/linkAccount/link_account.dart';
import 'package:gasto_certo/app/features/new_password/new_password_page.dart';
import 'package:gasto_certo/app/features/onboarding/onboarding_page.dart';
import 'package:gasto_certo/app/features/select_perfil/select_profile_page.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_page.dart';
import 'package:gasto_certo/app/features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      initialRoute: '/splash',
      routes: {
        //'/onBoarding': (context) => OnboardingPage(),
        '/splash': (context) => const SplashPage(),
        '/signIn': (context) => const SignInPage(),
        '/forgot': (context) => const ForgotPassword(),
        '/signUp': (context) => const SignUpPage(),
        'onBoarding': (context) => const OnboardingPage(),
        '/selectProfile': (context) => const SelectProfilePage(),
        '/newPassword': (context) => const NewPassword(),
        '/homeBottomBar': (context) => const HomeBottomBarPage(),
        '/linkAccount': (context) => const LinkAccount(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
