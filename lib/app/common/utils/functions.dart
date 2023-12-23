import 'package:gasto_certo/app/common/utils/lists.dart';
import 'package:gasto_certo/app/data/dataBase/db.dart';
import 'package:intl/intl.dart';

class Functions {
  dateParseToString(DateTime date) {
    String originalDate = "2023-10-29 09:10:51.405136";
    DateTime dateTime = DateTime.parse(originalDate);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  static initDatabaseSqfLite() async {
    await DBProvider().initDb();
  }

  static dynamic priceFormatter(dynamic value) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(value);
  }

  static NumberFormat currencyFormatter() =>
      NumberFormat.simpleCurrency(decimalDigits: 2, locale: 'pt-BR');

  static String timeMessage(DateTime timeNow) {
    timeNow = DateTime.now();
    if (timeNow.hour > 5 && timeNow.hour <= 12) {
      return "Bom dia,";
    } else if (timeNow.hour > 12 && timeNow.hour < 18) {
      return 'Boa tarde,';
    }
    return 'Boa noite,';
  }

  static ddmmyyyy(DateTime? datetime) {
    if (datetime == null) {
      return "";
    }
    var day = datetime.day.toString().padLeft(2, '0');
    var month = datetime.month.toString().padLeft(2, '0');
    var year = datetime.year;
    return "$day/$month/$year";
  }

  static String currentMonth() {
    DateTime now = DateTime.now();
    String currentMonth = '';
    return currentMonth = MONTHS[now.month - 1];
  }
}
