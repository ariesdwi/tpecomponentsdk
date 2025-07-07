import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/utils/color_utils.dart' show TPEColors;
import 'package:tpe_component_sdk/utils/spacers.dart';

class TopModal extends StatefulWidget {
  const TopModal.error({
    super.key,
    required this.message,
    this.icon = const Icon(
      Icons.cancel,
      color: TPEColors.white,
      size: 16,
    ),
    this.backgroundColor = Colors.red,
    this.textColor = TPEColors.white,
  });

  const TopModal.success({
    super.key,
    required this.message,
    this.icon = const Icon(
      Icons.check_circle,
      color: TPEColors.white,
      size: 16,
    ),
    this.backgroundColor = Colors.green,
    this.textColor = TPEColors.white,
  });

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<TopModal> createState() => _TopModalState();
}

class _TopModalState extends State<TopModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: widget.backgroundColor,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.icon,
          16.width,
          Expanded(
            child: DefaultTextStyle(
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
              child: Text(widget.message),
            ),
          ),
        ],
      ),
    );
  }
}
