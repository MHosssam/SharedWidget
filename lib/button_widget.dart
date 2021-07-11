import 'package:flutter/material.dart';
import 'package:shared_widget/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final Widget? titleWidget;
  final Color? color, titleColor;
  final double? width, hieght, fontSize;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  ButtonWidget(
      {this.onTap,
      this.color,
      this.titleColor = Colors.white,
      this.title,
      this.hieght,
      this.width,
      this.fontSize = 18.0,
      this.borderRadius,
      this.titleWidget,
      this.border});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: hieght ?? 48,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).buttonColor,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(3.0),
        ),
        child: Center(
          child: title == null
              ? titleWidget
              : TextWidget(
                  title ?? '',
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
        ),
      ),
    );
  }
}
