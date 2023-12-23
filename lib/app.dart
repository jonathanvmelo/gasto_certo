import 'package:flutter/material.dart';
import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_transaction_firebase.dart';
import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_transaction_local.dart';
import 'package:gasto_certo/app/common/constants/routes.dart';
import 'package:gasto_certo/app/common/themes/default_theme.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_home.dart';
import 'package:gasto_certo/app/features/home_bottom_bar/custom_page_view_page.dart';
import 'package:gasto_certo/app/features/forgot_password/forgot_password_page.dart';
import 'package:gasto_certo/app/features/home_bottom_bar/home_bottom_bar_page.dart';
import 'package:gasto_certo/app/features/pluggy/pluggy_page.dart';
import 'package:gasto_certo/app/features/linkAccount/link_account_page.dart';
import 'package:gasto_certo/app/features/new_password/new_password_page.dart';
import 'package:gasto_certo/app/features/onboarding/onboarding_page.dart';
import 'package:gasto_certo/app/features/select_perfil/select_profile_page.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_page.dart';
import 'package:gasto_certo/app/features/splash/splash_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlocTransactionLocal>(
          create: (context) => BlocTransactionLocal(),
        ),
        ChangeNotifierProvider<BlocTransactionFirebase>(
          create: (context) => BlocTransactionFirebase(),
        ),
      ],
      child: MaterialApp(
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
        // supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        initialRoute: NamedRoute.initial,
        routes: {
          NamedRoute.initial: (context) => const SplashPage(),
          NamedRoute.dashHome: (context) => DashboardHome(),
          NamedRoute.signIn: (context) => const SignInPage(),
          NamedRoute.signUp: (context) => SignUpPage(),
          NamedRoute.forgot: (context) => const ForgotPassword(),
          NamedRoute.onBoarding: (context) => const OnboardingPage(),
          NamedRoute.selectProfile: (context) => const SelectProfilePage(),
          NamedRoute.newPassword: (context) => const NewPassword(),
          NamedRoute.linkAccount: (context) => const LinkAccount(),
          NamedRoute.homeBottomBar: (context) => const HomeBottomBarPage(),
          NamedRoute.homePage: (context) => const HomePage(),
          NamedRoute.customBottom: (context) => const CustomPageViewPage(),

          //'/onBoarding': (context) => OnboardingPage(),
        },
      ),
    );
  }
}
