import 'package:intl/intl.dart';

class DateHelper {
  String getMonthAndDay(DateTime dateTime) {
    var formatter = DateFormat.MMMd("tr_TR");
    return formatter.format(dateTime);
  }

  String getMMMMd(DateTime dateTime) {
    var formatter = DateFormat.MMMMd("tr_TR");
    return formatter.format(dateTime);
  }
}
