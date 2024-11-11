class AppValidators {
  // Method to validate email
  static String? validateEmail(String? value, {String? labelName}) {
    if (value == null || value.isEmpty) {
      return labelName ?? 'Email cannot be empty';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Method to validate mobile number
  static String? validateMobile(String? value, {String? labelName}) {
    if (value == null || value.isEmpty) {
      return labelName ?? 'Mobile number cannot be empty';
    }
    String pattern = r'^[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  // Method to validate pin code
  static String? validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pin code cannot be empty';
    }
    String pattern = r'^[0-9]{6}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid 6-digit pin code';
    }
    return null;
  }

  static String? validatePanCardNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pan card no cannot be empty';
    }
    String pattern = r'[A-Z]{5}[0-9]{4}[A-Z]{1}';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter valid pancard number';
    }
    return null;
  }

  static String? validateAadhar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Aadhar card no cannot be empty';
    }
    String pattern = r'^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter valid Aadhar card number';
    }
    return null;
  }

  // Method to check if text is empty
  static String? validateNotEmpty(String? value, String fieldName,
      {bool checkSpecialCharacters = false,
      bool validateLength = false,
      int? minLength}) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    if (checkSpecialCharacters) {
      String pattern = r'^[a-zA-Z\s]+$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return '$fieldName cannot contain special characters';
      }
    }
    if (validateLength) {
      if (value.length < (minLength ?? 3)) {
        return '$fieldName should contain more then ${minLength ?? 3 - 1} characters';
      }
    }
    return null;
  }

  // Method to check if text is empty
  static String? validateIfscCode(String? value, String fieldName) {
    if (value == null || value.isEmpty || value.length < 11) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  // Method to check if text is empty
  static String? validateChequeNo(String? value, String fieldName) {
    if (value == null || value.isEmpty || value.length < 6) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  // Method to validate dropdown selection
  static String? validateDropdown(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please select a $fieldName';
    }
    return null;
  }
}
