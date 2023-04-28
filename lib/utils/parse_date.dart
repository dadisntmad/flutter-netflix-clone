import 'package:intl/intl.dart';

String parseDate(String date, String formatType) {
  final parsedDate = DateTime.parse(date);

  return DateFormat(formatType).format(parsedDate);
}
