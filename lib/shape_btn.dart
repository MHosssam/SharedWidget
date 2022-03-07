import 'package:flutter/material.dart';

class ShapeBtn extends StatelessWidget {
  const ShapeBtn({
    Key? key,
    this.padding,
    this.iconColor,
    this.alignment,
    this.cardColor,
    this.shadowColor,
    this.borderRadius,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color? iconColor;
  final Color? cardColor;
  final Color? shadowColor;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: cardColor,
        border: Border.all(color: shadowColor ?? Colors.black),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 5,
            offset: const Offset(0, 3),
            color: shadowColor ?? Colors.black,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: 31,
          color: iconColor,
        ),
      ),
    );
  }
}
