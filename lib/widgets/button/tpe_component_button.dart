import 'package:flutter/material.dart';

enum TPEButtonVariant { primary, outline, link, plain }
enum TPEButtonSize { small, medium }
enum TPEButtonRound { none, rounded, pill }

class TPERefineButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final TPEButtonVariant variant;
  final TPEButtonSize size;
  final TPEButtonRound roundType;
  final bool isCentered;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onPressed;

  const TPERefineButton({
    super.key,
    this.title,
    this.icon,
    required this.variant,
    required this.size,
    required this.roundType,
    this.isCentered = false,
    this.isLoading = false,
    this.isEnabled = true,
    required this.onPressed,
  });

  double get height => size == TPEButtonSize.medium ? 44 : 32;
  double get iconSize => size == TPEButtonSize.medium ? 20 : 16;
  double get horizontalPadding => size == TPEButtonSize.medium ? 20 : 16;
  double get borderRadius {
    switch (roundType) {
      case TPEButtonRound.pill:
        return height / 2;
      case TPEButtonRound.rounded:
        return 8;
      default:
        return 0;
    }
  }

  Color get backgroundColor {
    switch (variant) {
      case TPEButtonVariant.primary:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }

  Color get textColor {
    switch (variant) {
      case TPEButtonVariant.primary:
        return Colors.white;
      default:
        return Colors.blue;
    }
  }

  Color get borderColor {
    switch (variant) {
      case TPEButtonVariant.outline:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }

  double get borderWidth {
    switch (variant) {
      case TPEButtonVariant.outline:
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5,
      child: GestureDetector(
        onTap: isEnabled && !isLoading ? onPressed : null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isCentered
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      if (icon != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(icon, size: iconSize, color: textColor),
                        ),
                      if (title != null)
                        Text(
                          title!,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
