import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = NumberFormat("#,##0.##", "en_US");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-numeric characters except the decimal point
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // Handle multiple decimal points
    if (newText.contains('.') &&
        newText.indexOf('.') != newText.lastIndexOf('.')) {
      newText = newText.substring(0, newText.length - 1);
    }

    // Convert to double and format
    try {
      final double newValueAsDouble = double.parse(newText);
      final String formattedValue = _numberFormat.format(newValueAsDouble);

      // Determine cursor position
      int offset =
          formattedValue.length - newText.length + newValue.selection.end;

      return newValue.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: offset),
      );
    } catch (e) {
      // If parsing fails, return the original newValue
      return newValue;
    }
  }
}

class DotFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = NumberFormat("#,##0", "en_US");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    try {
      final int value = int.parse(newText);
      final String formattedValue = _numberFormat.format(value);

      // Maintain the cursor position
      int offset =
          formattedValue.length - newText.length + newValue.selection.end;

      return newValue.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: offset),
      );
    } catch (e) {
      // If parsing fails, return the original newValue
      return newValue;
    }
  }
}

String thousandSeparator(String value) {
  String cleanedValue = value.replaceAll(RegExp(r'[^\d.-]'), '');
  final double parsedValue = double.tryParse(cleanedValue) ?? 0.0;
  // Format the number
  final String numberFormat =
      NumberFormat("#,##0.00", "en_US").format(parsedValue);

  return numberFormat;
}

String extractCurrency(String value) {
  return RegExp(r'^[A-Za-z]+').firstMatch(value)?.group(0) ?? '';
}
