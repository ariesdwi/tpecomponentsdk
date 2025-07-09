import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tw_type/tpe_tw_card_section.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_tw_style.dart';

class TpeBalanceCardTwType extends StatelessWidget {
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final VoidCallback? seeAllCallback;
  final bool isLoading;
  final bool showCopy;
  final String? copyImage;
  final String? copyTitleText;
  final String? titleBalanceText;
  final String? seeAllText;
  final String? copySuccessMessage;
  final String? copyErrorMessage;
  final TextStyle? textAccountNumberStyle;
  final TextStyle? textCopyStyle;
  final TextStyle? textTitleBalanceStyle;
  final TextStyle? textCurrentBalanceStyle;
  final TextStyle? textCurrencyStyle;
  final TextStyle? textSeeAllStyle;
  final TpeBalanceTwCardStyle style;

  const TpeBalanceCardTwType({
    super.key,
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    this.seeAllCallback,
    this.showCopy = false,
    this.copyImage,
    this.copyTitleText = "Salin",
    this.titleBalanceText = "Saldo Rekening Utama",
    this.seeAllText,
    this.copyErrorMessage,
    this.isLoading = false,
    this.copySuccessMessage,
    this.textAccountNumberStyle,
    this.textCopyStyle,
    this.textTitleBalanceStyle,
    this.textCurrencyStyle,
    this.textCurrentBalanceStyle,
    this.textSeeAllStyle,
    this.style = const TpeBalanceTwCardStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: style.marginContainer,
      padding: style.paddingContainer,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: style.borderRadius,
        image: style.showBackgroundCard
            ? DecorationImage(
                image: AssetImage(
                  style.backgroundCard,
                  package: "tpe_component_sdk",
                ),
                fit: BoxFit.cover,
                opacity: style.backgroundImageOpacity,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: (style.shadowColor ?? Colors.black).withAlpha(25),
            blurRadius: style.shadowBlurRadius,
            spreadRadius: style.shadowSpreadRadius,
            offset: style.shadowOffset,
          ),
        ],
      ),
      child: TpeTwCardSection(
        accountNumber: accountNumber,
        balance: currentBalance.toString(),
        currency: currency,
        onTap: seeAllCallback,
        seeAllText: seeAllText,
        showCopy: showCopy,
        titleBalanceText: titleBalanceText,
        copyText: copyTitleText,
        isLoading: isLoading,
        copyImage: copyImage,
        successCopyMessage: copySuccessMessage,
        copyTextStyle: textCopyStyle,
        backgroundCardSeeAll: style.backgroundColor,
        accountNumberTextStyle: textAccountNumberStyle,
        titleBalanceTextStyle: textTitleBalanceStyle,
        balanceTextStyle: textCurrentBalanceStyle,
        currencyTextStyle: textCurrencyStyle,
        seeAllTextStyle: textSeeAllStyle,
      ),
    );
  }
}
