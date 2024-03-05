class NumberFormatter {
  static String formatNumber(int number) {
    if (number >= 0 && number <= 999) {
      return number.toString().padLeft(3, '0');
    } else {
      throw Exception('Number should be between 0 and 999');
    }
  }
}
