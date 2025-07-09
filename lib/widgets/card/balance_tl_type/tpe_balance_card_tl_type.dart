import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tl_type/tpe_account_section.dart';
import 'package:tpe_component_sdk/widgets/card/balance_tl_type/tpe_balance_card_section.dart';
import 'package:tpe_component_sdk/widgets/card/model/tpe_balance_card_tl_style.dart';

class TPEBalanceCardTLType extends StatefulWidget {
  final String accountNumber;
  final double currentBalance;
  final String? accountNumberTitle;
  final String currency;
  final String? currentBalanceTitle;
  final bool? isLoading;
  final TpeBalanceCardTlStyle style;
  final VoidCallback? onCopyAccountNumber;
  final String? copyIconPath;

  const TPEBalanceCardTLType({
    super.key,
    required this.accountNumber,
    required this.currentBalance,
    required this.currency,
    this.currentBalanceTitle,
    this.isLoading,
    this.accountNumberTitle,
    this.onCopyAccountNumber,
    this.copyIconPath = 'assets/svg/copy.svg',
    this.style = const TpeBalanceCardTlStyle(),
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
      duration: widget.style.animationDuration,
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
      Clipboard.setData(ClipboardData(text: widget.accountNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountNumber = widget.accountNumber;
    final accountNumberTitle = widget.accountNumberTitle;
    final borderRadius = widget.style.borderRadius ?? BorderRadius.circular(16);
    final marginContainer =
        widget.style.marginContainer ?? const EdgeInsets.all(16);
    final padding = widget.style.padding ?? const EdgeInsets.all(16);
    final bgColor = widget.style.backgroundColor ?? TPEColors.blue100;
    final secondaryBg =
        widget.style.secondaryBackgroundColor ?? TPEColors.blue80;
    final textColor = widget.style.textColor ?? TPEColors.white;
    final secondaryText = widget.style.secondaryTextColor ?? TPEColors.ligth30;

    return Container(
      margin: marginContainer,
      child: Column(
        children: [
          AccountSectionTLTypeCard(
            accountNumber: accountNumber,
            accountNumberTitle: accountNumberTitle,
            paddingAccountSection: padding,
            borderRadiusAccountSection: borderRadius,
            backgroundColorAccountSection: bgColor,
            textColor: textColor,
            secondaryTextColor: secondaryText,
            onCopy: _handleCopy,
            copyImage: widget.copyIconPath,
          ),
          BalanceSectionTLTypeCard(
            currentBalance: widget.currentBalance,
            currency: widget.currency,
            currentBalanceTitle: widget.currentBalanceTitle,
            isLoading: widget.isLoading,
            balanceVisible: _balanceVisible,
            onToggleVisibility: widget.style.showBalanceToggle ?? true
                ? _toggleBalanceVisibility
                : null,
            paddingBalanceCardTLSection: padding,
            borderRadiusBalanceCardTLSection: borderRadius,
            backgroundColorBalanceCardTLSection: secondaryBg,
            textColor: textColor,
            secondaryTextColor: secondaryText,
            fadeAnimation: _fadeAnimation,
            balanceFormatter: widget.style.balanceFormatter,
            currentBalanceTitleStyle: widget.style.currentBalanceTitleStyle,
          ),
        ],
      ),
    );
  }
}
