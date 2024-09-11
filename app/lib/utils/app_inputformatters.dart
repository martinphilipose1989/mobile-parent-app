import 'package:flutter/services.dart';

class AppInputformatters {
  // Method to get an input formatter for email
  static TextInputFormatter emailFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'));
  }

  // Method to get an input formatter for mobile number
  static TextInputFormatter mobileFormatter() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  // Method to get an input formatter for ifsc code
  static TextInputFormatter ifscCodeFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'^[A-Z0-9]*$'));
  }

  // Method to get an input formatter for pin code
  static TextInputFormatter pinCodeFormatter() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  // Method to get an input formatter for upper case text
  static TextInputFormatter upperCaseFormatter() {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        return TextEditingValue(
          text: newValue.text.toUpperCase(),
          selection: newValue.selection,
        );
      },
    );
  }

  // Method to get an input formatter for lower case text
  static TextInputFormatter lowerCaseFormatter() {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        return TextEditingValue(
          text: newValue.text.toLowerCase(),
          selection: newValue.selection,
        );
      },
    );
  }

  // Method to get an input formatter for custom pattern
  static TextInputFormatter customPatternFormatter(String pattern) {
    return FilteringTextInputFormatter.allow(RegExp(pattern));
  }
}
