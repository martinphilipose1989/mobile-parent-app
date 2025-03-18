class CurrencyFormatter {
  static String formatToRupee(String value) {
    // Parse the string to a double
    double? amount = double.tryParse(value);
    if (amount == null || value.isEmpty) {
      return '0';
    }

    // Handle the negative amount case
    bool isNegative = amount < 0;
    amount = amount.abs();

    // Format the double to a string with commas as per Indian Numbering System
    String amountStr = amount.toStringAsFixed(0);
    int len = amountStr.length;

    String formattedAmount = '';
    if (len > 3) {
      String lastThree = amountStr.substring(len - 3);
      String rest = amountStr.substring(0, len - 3);

      formattedAmount = rest.replaceAllMapped(
          RegExp(r'(\d)(?=(\d{2})+(?!\d))'), (Match match) => '${match[1]},');

      formattedAmount = '$formattedAmount,$lastThree';
    } else {
      formattedAmount = amountStr;
    }

    // Add the rupee sign and handle the negative case
    return '${isNegative ? '-' : ''}₹$formattedAmount';
  }
}
