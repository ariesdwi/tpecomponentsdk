import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';

class AccountSectionTLTypeCard extends StatelessWidget {
  final String accountNumber;
  final String? accountNumberTitle;
  final String? copyImage;
  final bool? isLoading;
  final EdgeInsets? paddingAccountSection;
  final BorderRadius? borderRadiusAccountSection;
  final Color? backgroundColorAccountSection;
  final Color? textColor;
  final Color? secondaryTextColor;
  final VoidCallback? onCopy;

  final TextStyle? accountNumberTextStyle;
  final TextStyle? accountNumberTitleTextStyle;

  const AccountSectionTLTypeCard({
    super.key,
    required this.accountNumber,
    this.accountNumberTitle,
    this.isLoading,
    this.copyImage,
    this.paddingAccountSection,
    this.borderRadiusAccountSection,
    this.backgroundColorAccountSection,
    this.textColor,
    this.secondaryTextColor,
    this.onCopy,

    this.accountNumberTextStyle,
    this.accountNumberTitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: paddingAccountSection,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAccountSection?.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        color: backgroundColorAccountSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            accountNumberTitle ?? "Account Number",
            style:
                accountNumberTitleTextStyle ??
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
                effect: ShimmerEffect(
                  baseColor: TPEColors.blue20,
                  highlightColor: Colors.grey[100]!,
                  duration: const Duration(seconds: 2),
                ),
                child: Text(
                  isLoading ?? false
                      ? '000 000 000 000 000'
                      : formatAccountNumber(accountNumber),
                  style:
                      accountNumberTextStyle ??
                      theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: isLoading ?? false ? null : onCopy,
                child: SvgPicture.asset(
                  copyImage ?? 'assets/svg/copy.svg',
                  width: 20,
                  package: 'tpe_component_sdk',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
