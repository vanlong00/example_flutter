extension StringExtensions on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
    return phoneRegex.hasMatch(this) && length >= 10;
  }

  bool get isValidUrl {
    final urlRegex = RegExp(r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$');
    return urlRegex.hasMatch(this);
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }

  bool get isNumeric => double.tryParse(this) != null;

  String removeWhitespace() => replaceAll(RegExp(r'\s+'), '');

  bool get isNullOrEmpty => isEmpty;

  String? get nullIfEmpty => isEmpty ? null : this;
}
