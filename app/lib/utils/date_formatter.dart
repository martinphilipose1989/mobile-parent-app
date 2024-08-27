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
}
