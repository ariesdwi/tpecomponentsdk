String formatAccountNumber(String input) {
  final buffer = StringBuffer();
  final pattern = RegExp(r'.{1,4}'); // ambil per 4 karakter
  final matches = pattern.allMatches(input);

  for (final match in matches) {
    buffer.write(match.group(0));
    if (match.end != input.length) buffer.write(' ');
  }

  return buffer.toString();
}

// Use this function to format number with dot separator and decimal
String formatNumberDotToDecimal(String number) {
  // Remove periods
  String result = number.replaceAll(',', '');
  return result;
}
