import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double radius;
  final double iconSize;
  final bool flipHorizontally;
  final VoidCallback? onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = const Color(0xff051D13),
    this.iconColor = Colors.white,
    this.radius = 20,
    this.iconSize = 25,
    this.flipHorizontally = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, color: iconColor, size: iconSize);
    if (flipHorizontally) {
      iconWidget = Transform.scale(scaleX: -1, child: iconWidget);
    }
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: iconWidget,
      ),
    );
  }
}
