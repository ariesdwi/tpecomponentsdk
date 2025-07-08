import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tl_type/tpe_account_section.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tl_type/tpe_balance_card_section.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_data.dart';

class TPEBalanceCardTLType extends StatefulWidget {
  final TpeBalanceCardData data;
  final VoidCallback? onCopyAccountNumber;
  final String copyIconPath;
  final String? Function(String)? accountNumberFormatter;
  final String? Function(double)? balanceFormatter;
  final bool showBalanceToggle;
  final Duration animationDuration;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? marginContainer;
  final Color? backgroundColor;
  final Color? secondaryBackgroundColor;
  final Color? textColor;
  final Color? secondaryTextColor;

  const TPEBalanceCardTLType({
    super.key,
    required this.data,
    this.onCopyAccountNumber,
    this.copyIconPath = 'assets/svg/copy.svg',
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
  });

  @override
  State<TPEBalanceCardTLType> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<TPEBalanceCardTLType>
    with SingleTickerProviderStateMixin {
  bool _balanceVisible = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBalanceVisibility() {
    setState(() {
      _balanceVisible = !_balanceVisible;
      if (_balanceVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _handleCopy() {
    if (widget.onCopyAccountNumber != null) {
      widget.onCopyAccountNumber!();
    } else {
      Clipboard.setData(ClipboardData(text: widget.data.accountNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(16);
    final marginContainer = widget.marginContainer ?? const EdgeInsets.all(16);
    final padding = widget.padding ?? const EdgeInsets.all(16);
    final bgColor = widget.backgroundColor ?? TPEColors.blue100;
    final secondaryBg = widget.secondaryBackgroundColor ?? TPEColors.blue80;
    final textColor = widget.textColor ?? TPEColors.white;
    final secondaryText = widget.secondaryTextColor ?? TPEColors.ligth30;

    return Container(
      margin: marginContainer,
      child: Column(
        children: [
          AccountSectionTLTypeCard(
            data: widget.data,
            padding: padding,
            borderRadius: borderRadius,
            backgroundColor: bgColor,
            textColor: textColor,
            secondaryTextColor: secondaryText,
            onCopy: _handleCopy,
            copyIconPath: widget.copyIconPath,
          ),
          BalanceSectionTLTypeCard(
            data: widget.data,
            balanceVisible: _balanceVisible,
            onToggleVisibility: widget.showBalanceToggle
                ? _toggleBalanceVisibility
                : null,
            padding: padding,
            borderRadius: borderRadius,
            backgroundColor: secondaryBg,
            textColor: textColor,
            secondaryTextColor: secondaryText,
            fadeAnimation: _fadeAnimation,
            balanceFormatter: widget.balanceFormatter,
          ),
        ],
      ),
    );
  }
}
