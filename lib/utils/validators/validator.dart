class Validator {
  static String? validateEmptyField(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null) {
      return 'Email is required';
    }

    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
        caseSensitive: false, multiLine: false);

    if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    // Remove all non-numeric characters
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');

    // Check for common phone number patterns
    final RegExp phoneRegExp = RegExp(
      r'^([+]?[\s0-9]+)?(\d{10,12})$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!phoneRegExp.hasMatch(cleanedNumber)) {
      return 'Enter a valid phone number';
    }

    // Additional length check
    if (cleanedNumber.length < 10 || cleanedNumber.length > 15) {
      return 'Phone number must be between 10 and 15 digits';
    }

    return null;
  }
}
