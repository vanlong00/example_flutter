class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? minLength(String? value, int min, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    if (value.length < min) {
      return '${fieldName ?? 'This field'} must be at least $min characters';
    }
    return null;
  }

  static String? maxLength(String? value, int max, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.length > max) {
      return '${fieldName ?? 'This field'} must not exceed $max characters';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    if (value.replaceAll(RegExp(r'[^\d]'), '').length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    final urlRegex = RegExp(r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$');
    if (!urlRegex.hasMatch(value)) {
      return 'Enter a valid URL';
    }
    return null;
  }

  static String? number(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    if (double.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a valid number';
    }
    return null;
  }

  static String? intNumber(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    if (int.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a valid integer';
    }
    return null;
  }

  static String? min(String? value, double min, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    final numValue = double.tryParse(value);
    if (numValue == null) {
      return '${fieldName ?? 'This field'} must be a valid number';
    }
    if (numValue < min) {
      return '${fieldName ?? 'Value'} must be at least $min';
    }
    return null;
  }

  static String? max(String? value, double max, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    final numValue = double.tryParse(value);
    if (numValue == null) {
      return '${fieldName ?? 'This field'} must be a valid number';
    }
    if (numValue > max) {
      return '${fieldName ?? 'Value'} must not exceed $max';
    }
    return null;
  }

  static String? range(String? value, double min, double max, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    final numValue = double.tryParse(value);
    if (numValue == null) {
      return '${fieldName ?? 'This field'} must be a valid number';
    }
    if (numValue < min || numValue > max) {
      return '${fieldName ?? 'Value'} must be between $min and $max';
    }
    return null;
  }

  static String? date(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    if (DateTime.tryParse(value) == null) {
      return 'Enter a valid date';
    }
    return null;
  }

  static String? futureDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    final date = DateTime.tryParse(value);
    if (date == null) {
      return 'Enter a valid date';
    }
    if (date.isBefore(DateTime.now())) {
      return 'Date must be in the future';
    }
    return null;
  }

  static String? pastDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    final date = DateTime.tryParse(value);
    if (date == null) {
      return 'Enter a valid date';
    }
    if (date.isAfter(DateTime.now())) {
      return 'Date must be in the past';
    }
    return null;
  }

  static String? match(String? value, RegExp pattern, String message) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!pattern.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? Function(String?) compose(List<String? Function(String?)> validators) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
