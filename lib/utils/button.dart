import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';

class SquareIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color iconColor, buttonColor;
  final IconData icon;
  final double width;
  final double borderRadius;

  const SquareIconButton({
    Key? key,
    required this.onPressed,
    this.iconColor = COLOR_GREEN,
    required this.buttonColor,
    required this.icon,
    this.width = 70,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: width,
        child: Icon(icon, color: iconColor,),
        color: buttonColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius)
        ),
      ),
    );
  }
}
