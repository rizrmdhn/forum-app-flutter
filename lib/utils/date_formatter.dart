import 'package:timeago/timeago.dart' as dateformatter;

class DateFormatter {
  static String format(DateTime date) {
    dateformatter.setLocaleMessages('id', dateformatter.IdMessages());
    return dateformatter.format(date, locale: 'id');
  }
}
