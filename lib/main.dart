import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gasto_certo/app.dart';
import 'package:gasto_certo/app/locator.dart';
import 'package:gasto_certo/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  await dotenv.load(fileName: ".env");

  initializeDateFormatting().then((_) => runApp(const App()));
}
