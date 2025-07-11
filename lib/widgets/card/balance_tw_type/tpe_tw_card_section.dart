import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';
import 'package:tpe_component_sdk/utils/spacers.dart';
import 'package:tpe_component_sdk/utils/top_modal.dart';

class TpeTwCardSection extends StatefulWidget {
  final String accountNumber;
  final String balance;
  final String currency;
  final VoidCallback? onTap;
  final String? copyImage;
  final String? copyText;
  final String? seeAllText;
  final String? titleBalanceText;
  final String? successCopyMessage;
  final String? errorCopyMessage;
  final String? errorMessage;
  final bool showCopy;
  final bool showError;
  final Color? backgroundCardSeeAll;
  final bool isLoading;
  final TextStyle? accountNumberTextStyle;
  final TextStyle? balanceTextStyle;
  final TextStyle? titleBalanceTextStyle;
  final TextStyle? currencyTextStyle;
  final TextStyle? copyTextStyle;
  final TextStyle? seeAllTextStyle;

  const TpeTwCardSection({
    super.key,
    required this.accountNumber,
    required this.balance,
    required this.currency,
    required this.backgroundCardSeeAll,
    required this.onTap,
    this.titleBalanceText,
    this.copyImage = 'assets/svg/copy.svg',
    this.copyText,
    this.seeAllText,
    this.successCopyMessage,
    this.errorCopyMessage = "",
    this.showCopy = false,
    this.showError = false,
    this.errorMessage,
    this.isLoading = false,
    this.accountNumberTextStyle,
    this.balanceTextStyle,
    this.titleBalanceTextStyle,
    this.currencyTextStyle,
    this.copyTextStyle,
    this.seeAllTextStyle,
  });

  @override
  State<TpeTwCardSection> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<TpeTwCardSection> {
  bool visible = false;
  var eyeIcon = Icons.visibility;

  void showhide() {
    setState(() {
      visible = !visible;
      if (visible == true) {
        eyeIcon = Icons.visibility_off;
      } else {
        eyeIcon = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatAccountNumber(widget.accountNumber),
                style:
                    widget.accountNumberTextStyle ??
                    TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TPEColors.blue80,
                    ),
              ),
              if (widget.showCopy)
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: widget.accountNumber),
                    ).then((_) {
                      showTopSnackBar(
                        Overlay.of(context),
                        TopModal.success(
                          message: widget.successCopyMessage ?? "",
                        ),
                        displayDuration: Duration(seconds: 3),
                      );
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.copyText ?? "",
                        style:
                            widget.copyTextStyle ??
                            TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: TPEColors.blue80,
                            ),
                      ),
                      8.width,
                      SvgPicture.asset(
                        widget.copyImage ?? 'assets/svg/copy.svg',
                        width: 20,
                        package: 'tpe_component_sdk',
                      ),
                    ],
                  ),
                ),
            ],
          ),
          Divider(color: TPEColors.ligth20, thickness: 1),
          Text(
            widget.titleBalanceText ?? "",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: TPEColors.ligth80,
            ),
          ),
          widget.showError
              ? Text(
                  widget.errorMessage ?? widget.errorCopyMessage ?? "",
                  softWrap: true,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: TPEColors.blue80,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Row(
                  children: [
                    Text(
                      widget.currency,
                      style:
                          widget.currencyTextStyle ??
                          TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: TPEColors.blue80,
                          ),
                    ),
                    8.width,
                    if (visible)
                      Row(
                        children: [
                          Text(
                            widget.balance,
                            style:
                                widget.balanceTextStyle ??
                                TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: TPEColors.blue80,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          8.width,
                        ],
                      )
                    else
                      widget.isLoading == true
                          ? Text(
                              widget.balance,
                              style:
                                  widget.balanceTextStyle ??
                                  TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: TPEColors.blue80,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          : Row(
                              children: List.generate(5, (index) {
                                return Container(
                                  width: 12,
                                  height: 12,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: TPEColors.blue80,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                );
                              }),
                            ),
                    widget.isLoading
                        ? Container()
                        : GestureDetector(
                            onTap: () => showhide(),
                            child: Icon(
                              eyeIcon,
                              color: TPEColors.blue80,
                              size: 24,
                            ),
                          ),
                  ],
                ),
          Card(
            elevation: 0,
            margin: EdgeInsets.only(top: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: widget.backgroundCardSeeAll?.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.seeAllText ?? "Lihat Semua Rekeningmu",
                      style:
                          widget.seeAllTextStyle ??
                          TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: TPEColors.ligth80,
                          ),
                    ),
                    Icon(Icons.arrow_forward, color: TPEColors.blue80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
