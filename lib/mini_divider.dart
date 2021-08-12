import 'package:flutter/material.dart';

class MiniDivider extends StatelessWidget {
  final double? width, height, marginTop, marginBottom, marginLeft, marginRight;
  final Color? color;
  const MiniDivider({
    Key? key,
    this.width,
    this.height,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1,
      width: width,
      alignment: Alignment.topLeft,
      color: color ?? Colors.grey,
      margin: EdgeInsets.only(
        top: marginTop ?? 0.0,
        bottom: marginBottom ?? 0.0,
        left: marginLeft ?? 0.0,
        right: marginRight ?? 0.0,
      ),
    );
  }
}
