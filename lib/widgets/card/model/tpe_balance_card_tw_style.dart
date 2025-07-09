import 'package:flutter/material.dart';

class TpeBalanceTwCardStyle {
  final Color backgroundColor;
  final Color? shadowColor;
  final String backgroundCard;
  final double backgroundImageOpacity;
  final EdgeInsets paddingContainer;
  final EdgeInsets marginContainer;
  final BorderRadius borderRadius;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;
  final bool showBackgroundCard;

  const TpeBalanceTwCardStyle({
    this.backgroundColor = Colors.white,
    this.backgroundCard = 'assets/images/Taiwan_card_image_2.png',
    this.shadowColor,
    this.backgroundImageOpacity = 0.4,
    this.paddingContainer = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    this.marginContainer = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.shadowBlurRadius = 20,
    this.shadowSpreadRadius = 0,
    this.shadowOffset = const Offset(0, 8),
    this.showBackgroundCard = true,
  });
}