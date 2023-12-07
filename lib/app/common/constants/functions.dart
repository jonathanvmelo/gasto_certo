import 'package:intl/intl.dart';

class Functions {
  static String priceFormatter(double value) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(value);
  }

  static NumberFormat currencyFormatter() =>
      NumberFormat.simpleCurrency(decimalDigits: 2, locale: 'pt-BR');
}
