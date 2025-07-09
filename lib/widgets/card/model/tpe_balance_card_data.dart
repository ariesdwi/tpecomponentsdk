import 'package:flutter/material.dart';

class TpeBalanceCardData {
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final bool isLoading;
  final bool showCopy;
  final String? copyImage;
  final String? copyTitleText;
  final String? titleBalanceText;
  final String? copySuccessMessage;
  final String? copyErrorMessage;
  final TextStyle? textStyleBalanceNumber;
  final TextStyle? textCopyStyle;
  final TextStyle? textTitleBalanceStyle;
  final TextStyle? textCurrentBalanceStyle;
  final TextStyle? textCurrencyStyle;

  const TpeBalanceCardData({
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    this.showCopy = false,
    this.copyImage,
    this.copyTitleText,
    this.titleBalanceText,
    this.copyErrorMessage,
    this.isLoading = false,
    this.copySuccessMessage,
    this.textStyleBalanceNumber,
    this.textCopyStyle,
    this.textTitleBalanceStyle,
    this.textCurrencyStyle,
    this.textCurrentBalanceStyle
  });
}
