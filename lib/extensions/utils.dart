part of 'extensions.dart';

class Utils {
  bool isValidEmail(String emailAddress) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(emailAddress)
          ? true
          : false;

  bool isValidPhone(String phone) =>
      RegExp(r"(\+62 ((\d{3}([ -]\d{3,})([- ]\d{4,})?)|(\d+)))|(\(\d+\) \d+)|\d{3}( \d+)+|(\d+[ -]\d+)|\d+")
              .hasMatch(phone)
          ? true
          : false;

  String convertDate(DateTime input) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(input);

    return formatted;
  }

  String convertDateTime(DateTime input) {
    final DateFormat formatter = DateFormat('dd MMM yyyy HH:mm');
    final String formatted = formatter.format(input);

    return formatted;
  }
}
