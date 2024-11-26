import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String dateString) {
    try {
      // Parse the string date in ISO 8601 format
      DateTime date = DateTime.parse(dateString);

      // Format the date to dd/mm/yyyy
      String formattedDate =
          "${_formatWithLeadingZero(date.day)}/${_formatWithLeadingZero(date.month)}/${date.year}";
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String _formatWithLeadingZero(int value) {
    return value < 10 ? '0$value' : value.toString();
  }




  static String dateFormat(String date) {
    try {
      // Parse the input date string as a DateTime object
      DateTime parsedDate = DateTime.parse(date);

      // Format the parsed date to 'yyyy-MM-dd'
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      // Return an empty string in case of parsing errors
      return "";
    }
  }

  static String convertDateToYearMonth(DateTime date) {
    // Format the DateTime object to 'yyyy-MM'
    return DateFormat('yyyy-MM').format(date);
  }

}
