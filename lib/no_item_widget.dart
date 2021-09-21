import 'package:flutter/material.dart';
import 'package:shared_widget/text_widget.dart';

class NoItemWidget extends StatelessWidget {
  final Widget child;
  final String? text;
  final double? height;

  const NoItemWidget({
    Key? key,
    required this.child,
    this.text,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: child,
            ),
            TextWidget(
              text ?? 'there is no items',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
