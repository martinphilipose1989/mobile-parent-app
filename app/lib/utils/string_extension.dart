// extension on String
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }

  bool isEmptyOrNull() {
    return (this??"").isEmpty || this == null || (this??'').contains('N/A');
  }
}

extension DateTimeExtensions on DateTime {
  bool isNotToday() {
    final now = DateTime.now();
    return !DateUtils.isSameDay(this, now);
  }
}

class DateUtils {
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
}
