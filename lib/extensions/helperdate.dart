part of 'extensions.dart';

extension DateHelper on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }

  String convertDatetimeToDb(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(date);
  }

  String convertStringToDb(String date) {
    var convert = date.split("/");
    return "${convert[2]}-${convert[1]}-${convert[0]}";
  }
}
