class Validator {
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
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      return 'Phone number is required';
    }

    final RegExp phoneRegExp1 =
        RegExp(r'^\d{10} $', caseSensitive: false, multiLine: false);

    final RegExp phoneRegExp2 =
        RegExp(r'^\d{11}$', caseSensitive: false, multiLine: false);

    if (!phoneRegExp1.hasMatch(phoneNumber) ||
        !phoneRegExp2.hasMatch(phoneNumber)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
