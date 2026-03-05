extension IntExtensions on int {
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);

  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;

  int clamp(int min, int max) => this < min ? min : (this > max ? max : this);
}

extension DoubleExtensions on double {
  String toPercentage({int decimals = 0}) {
    return '${(this * 100).toStringAsFixed(decimals)}%';
  }

  String toCurrency({String symbol = '\$', int decimals = 2}) {
    return '$symbol${toStringAsFixed(decimals)}';
  }

  double roundTo(int decimals) {
    final factor = 10.0 * decimals;
    return (this * factor).round() / factor;
  }
}

extension NumExtensions on num {
  bool isBetween(num min, num max) => this >= min && this <= max;
}
