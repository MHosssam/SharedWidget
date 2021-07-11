import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextWidget extends AutoSizeText {
  TextWidget(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    String? fontFamily,
  }) : super(
          text,
          overflow: textOverflow,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: height ?? 1.5,
            fontFamily: fontFamily,
          ),
          textAlign: textAlign ?? TextAlign.center,
          maxLines: maxLines,
        );
}
