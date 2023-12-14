import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RectButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  const RectButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: AppSize.s18, color: iconColor),
      ),
    );
  }
}
