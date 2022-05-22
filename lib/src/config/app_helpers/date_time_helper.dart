import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  String toDateAPI() {
    return DateFormat('yyyy-MM-dd').format(this).toString();
  }

  String toDate() {
    return DateFormat('dd.MM.yy').format(this).toString();
  }

  String toDateTime() {
    return DateFormat('dd.MM.yy HH:ss').format(this).toString();
  }
}