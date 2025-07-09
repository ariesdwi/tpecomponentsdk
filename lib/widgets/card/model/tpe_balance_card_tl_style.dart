import 'package:flutter/material.dart';

class TpeBalanceCardTlStyle {
  final String? Function(String)? accountNumberFormatter;
  final String? Function(double)? balanceFormatter;
  final bool? showBalanceToggle;
  final Duration? animationDuration;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? marginContainer;
  final Color? backgroundColor;
  final Color? secondaryBackgroundColor;
  final Color? textColor;
  final Color? secondaryTextColor;
  final TextStyle? currentBalanceTitleStyle;

  const TpeBalanceCardTlStyle({
    this.accountNumberFormatter,
    this.balanceFormatter,
    this.showBalanceToggle = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.borderRadius,
    this.marginContainer,
    this.padding,
    this.backgroundColor,
    this.secondaryBackgroundColor,
    this.textColor,
    this.secondaryTextColor,
    this.currentBalanceTitleStyle
  });
}
