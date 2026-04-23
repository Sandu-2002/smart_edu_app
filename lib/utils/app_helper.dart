import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date) =>
      DateFormat('dd MMM yyyy').format(date);
  static String formatTime(DateTime date) => DateFormat('hh:mm a').format(date);
}
