extension NumExtension on num {
  String formatNumber() {
    if (this >= 1e12) {
      return '${(this / 1e12).toStringAsFixed(1)}T'; // Trillion
    } else if (this >= 1e9) {
      return '${(this / 1e9).toStringAsFixed(1)}B'; // Billion
    } else if (this >= 1e6) {
      return '${(this / 1e6).toStringAsFixed(1)}M'; // Million
    } else if (this >= 1e3) {
      return '${(this / 1e3).toStringAsFixed(1)}K'; // Thousand
    } else {
      return toStringAsFixed(2); // Less than 1,000
    }
  }
}
