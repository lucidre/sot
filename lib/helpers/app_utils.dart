import 'package:intl/intl.dart';

AppUtils $appUtil = AppUtils();

class AppUtils {
  bool isEmailValid(String? email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@+[a-zA-Z0-9]+\.[a-zA-Z]")
      .hasMatch(email ?? "");

  String formattedDate(int timestamp) {
    try {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } catch (exception) {
      return "";
    }
  }

  String formattedDateFull(int timestamp) {
    try {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('MMMM dd, yyyy').format(dateTime);
    } catch (exception) {
      return "";
    }
  }

  String detailedFormattedDate(int timestamp) {
    try {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      if (today.day == dateTime.day &&
          today.month == dateTime.month &&
          today.year == dateTime.year) {
        return DateFormat('h:mm a').format(dateTime);
      } else {
        return DateFormat('MMM dd, yyyy').format(dateTime);
      }
    } catch (exception) {
      return "";
    }
  }
}
