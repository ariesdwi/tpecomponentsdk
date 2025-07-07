import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_data.dart';

class BalanceSectionTLTypeCard extends StatelessWidget {
  final TpeBalanceCardData data;
  final bool balanceVisible;
  final VoidCallback? onToggleVisibility;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Animation<double> fadeAnimation;
  final String? Function(double)? balanceFormatter;

  const BalanceSectionTLTypeCard({
    super.key,
    required this.data,
    required this.balanceVisible,
    required this.onToggleVisibility,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.fadeAnimation,
    required this.balanceFormatter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius.copyWith(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Balance',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Skeletonizer(
                enabled: data.isLoading,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: balanceVisible
                      ? FadeTransition(
                          opacity: fadeAnimation,
                          key: const ValueKey(1),
                          child: Text(
                            data.isLoading
                                ? 'USD 000000.00'
                                : balanceFormatter?.call(data.currentBalance) ??
                                    "${data.currency} ${data.currentBalance.toStringAsFixed(2)}",
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
                    balanceVisible ? Icons.visibility_off : Icons.visibility,
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
