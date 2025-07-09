import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';

class BalanceSectionTLTypeCard extends StatelessWidget {
  final double currentBalance;
  final String currency;
  final String? currentBalanceTitle;
  final bool? isLoading;
  final bool? balanceVisible;
  final VoidCallback? onToggleVisibility;
  final EdgeInsets? paddingBalanceCardTLSection;
  final BorderRadius? borderRadiusBalanceCardTLSection;
  final Color? backgroundColorBalanceCardTLSection;
  final Color? textColor;
  final Color? secondaryTextColor;
  final Animation<double> fadeAnimation;
  final String? Function(double)? balanceFormatter;
  final TextStyle? currentBalanceTitleStyle;

  const BalanceSectionTLTypeCard({
    super.key,
    required this.currentBalance,
    required this.currency,
    this.currentBalanceTitle,
    this.isLoading,
    this.balanceVisible,
    this.onToggleVisibility,
    this.paddingBalanceCardTLSection,
    this.borderRadiusBalanceCardTLSection,
     this.backgroundColorBalanceCardTLSection,
     this.textColor,
     this.secondaryTextColor,
     required this.fadeAnimation,
     this.balanceFormatter,
     this.currentBalanceTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: paddingBalanceCardTLSection,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadiusBalanceCardTLSection?.copyWith(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
        color: backgroundColorBalanceCardTLSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentBalanceTitle ?? 'Account Balance',
            style:
                currentBalanceTitleStyle ??
                theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: secondaryTextColor,
                ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Skeletonizer(
                enabled: isLoading ?? false,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: balanceVisible ?? true
                      ? FadeTransition(
                          opacity: fadeAnimation,
                          key: const ValueKey(1),
                          child: Text(
                            isLoading ?? false
                                ? 'USD 000000.00'
                                : balanceFormatter?.call(currentBalance) ??
                                      "${currency} ${currentBalance.toStringAsFixed(2)}",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        )
                      : const Text(
                          '. . . .   . . . . . . . . . . . . ',
                          key: ValueKey(2),
                          style: TextStyle(
                            color: TPEColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              if (onToggleVisibility != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(
                    balanceVisible ?? true ? Icons.visibility_off : Icons.visibility,
                    color: textColor,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
