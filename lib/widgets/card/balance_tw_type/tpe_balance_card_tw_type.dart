import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tw_type/tpe_tw_card_section.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_data.dart';

class TpeBalanceCardTwType extends StatelessWidget {
  final TpeBalanceCardData data;

  // UI appearance parameters
  final Color backgroundColor;
  final Color? shadowColor;
  final String backgroundCard;
  final double backgroundImageOpacity;
  final EdgeInsets paddingContainer;
  final EdgeInsets marginContainer;
  final BorderRadius borderRadius;

  // Shadow parameters
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;

  final bool showBackgroundCard;

  const TpeBalanceCardTwType({
    super.key,
    required this.data,
    required this.backgroundColor,
    this.backgroundCard = 'assets/images/Taiwan_card_image_2.png',
    this.shadowColor,
    this.backgroundImageOpacity = 0.4,
    this.paddingContainer = const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    this.marginContainer = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.shadowBlurRadius = 20,
    this.shadowSpreadRadius = 0,
    this.shadowOffset = const Offset(0, 8),
    this.showBackgroundCard = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginContainer,
      padding: paddingContainer,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        image: showBackgroundCard ? DecorationImage(
          image: AssetImage(backgroundCard),
          fit: BoxFit.cover,
          opacity: backgroundImageOpacity,
        ) : null,
        boxShadow: [
          BoxShadow(
            color: (shadowColor ?? Colors.black).withAlpha(25),
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: TpeTwCardSection(
        accountNumber: data.accountNumber,
        balance: data.currentBalance.toString(),
        currency: data.currency,
        showCopy: data.showCopy,
        titleBalanceText: data.titleBalanceText,
        copyText: data.copyTitleText,
        isLoading: data.isLoading,
        successCopyMessage: data.copySuccessMessage,
        backgroundCardSeeAll: backgroundColor,
      ),
    );
  }
}

