import 'package:flutter/material.dart';
import 'package:shared_widget/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Widget? titleWidget;
  final Color? color, titleColor;
  final double? width, hieght, fontSize;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final TextAlign? textAlign;
  const ButtonWidget({
    Key? key,
    this.onTap,
    this.color,
    this.titleColor = Colors.white,
    this.title,
    this.hieght,
    this.width,
    this.fontSize,
    this.borderRadius,
    this.titleWidget,
    this.border,
    this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.secondary,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(4.0),
        ),
        child: title == null
            ? titleWidget
            : Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: TextWidget(
                  title ?? '',
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Colors.black,
                  textAlign: textAlign ?? TextAlign.center,
                ),
              ),
      ),
    );
  }
}
