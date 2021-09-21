import 'package:flutter/material.dart';

class TextWidget extends Text {
  TextWidget(
    String? text, {
    Key? key,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    int? maxLines = 1,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
    String? fontFamily,
    TextDirection? textDirection,
  }) : super(
          text ?? '',
          key: key,
          overflow: textOverflow,
          textDirection: textDirection,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration,
            height: height ?? 1,
            fontFamily: fontFamily,

            ///TODO: add font family
            //?? AppUi.fonts.arabicFont,
          ),
          textAlign: textAlign ?? TextAlign.center,
          maxLines: maxLines,
        );
}
