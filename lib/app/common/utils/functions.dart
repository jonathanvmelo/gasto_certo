import 'package:intl/intl.dart';

dateParseToString(DateTime date) {
  String originalDate = "2023-10-29 09:10:51.405136";
  DateTime dateTime = DateTime.parse(originalDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
