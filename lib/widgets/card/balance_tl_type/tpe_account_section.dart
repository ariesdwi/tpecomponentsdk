import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_data.dart';

class AccountSectionTLTypeCard extends StatelessWidget {
  final TpeBalanceCardData data;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color secondaryTextColor;
  final VoidCallback onCopy;
  final String copyIconPath;
  const AccountSectionTLTypeCard({super.key, 
    required this.data,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.onCopy,
    required this.copyIconPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Number',
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
                effect: ShimmerEffect(
                  baseColor: TPEColors.blue20,
                  highlightColor: Colors.grey[100]!,
                  duration: const Duration(seconds: 2),
                ),
                child: Text(
                  data.isLoading
                      ? '000 000 000 000 000'
                      : formatAccountNumber(data.accountNumber),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: data.isLoading ? null : onCopy,
                child: SvgPicture.asset(copyIconPath, width: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
