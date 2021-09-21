import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  const AppTabs({
    Key? key,
    required this.isShadow,
    required this.children,
    this.marginTop,
    this.marginBottom,
  }) : super(key: key);

  final double? marginTop, marginBottom;
  final List<Widget> children;
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 40,
      margin: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: marginBottom ?? 16.0,
        top: marginTop ?? 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: isShadow
            ? [
                BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
