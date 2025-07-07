import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback onPressed;
  final int? badgeCount;
  final Color badgeColor;
  final Color badgeTextColor;
  final double badgeSize;
  final bool showShadow;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.borderColor,
    this.borderWidth = 0,
    required this.onPressed,
    this.badgeCount,
    this.badgeColor = Colors.red,
    this.badgeTextColor = Colors.white,
    this.badgeSize = 16,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: borderWidth,
       )
                : null,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                   blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(size / 2),
              onTap: onPressed,
              child: Center(
                child: Icon(
                  icon,
                  size: size * 0.6,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            top: -badgeSize / 3,
            right: -badgeSize / 3,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  badgeCount!.toString(),
                  style: TextStyle(
                    color: badgeTextColor,
                    fontSize: badgeSize * 0.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}