extension StringExtension on String {
  String toCapitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String removePatterns(Iterable<Pattern> removedPatterns) {
    String result = this;

    for (final chars in removedPatterns) {
      result = result.replaceAll(chars, '');
    }

    return result;
  }
}
