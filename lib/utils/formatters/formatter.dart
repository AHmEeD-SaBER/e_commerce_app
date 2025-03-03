import 'package:intl/intl.dart';

class Formatter {
  static String formatCurrency(double amount) {
    return NumberFormat.simpleCurrency().format(amount);
  }

  static String formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String formatPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAllMapped(RegExp(r'(\d{4})(\d{3})(\d{4})'),
        (match) {
      return '(${match[1]}) ${match[2]}-${match[3]}';
    });
  }

  static String formatInternationalPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAllMapped(RegExp(r'(\d{2})(\d{4})(\d{3})(\d{4})'),
        (match) {
      return '+${match[1]} (${match[2]}) ${match[3]}-${match[4]}';
    });
  }
}
