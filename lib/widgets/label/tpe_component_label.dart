import 'package:flutter/material.dart';

class TPELabelChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderRadiusGeometry borderRadius;

  const TPELabelChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.width = 68, // ✅ fixed width
    this.height = 26, // ✅ fixed height
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      alignment: Alignment.center, // ✅ center the label
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
