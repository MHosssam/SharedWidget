import 'package:flutter/material.dart';

class ContainerImages extends StatelessWidget {
  final double? height, widths;
  final String? imageurl;
  final BorderRadius? borderRadius;
  final double? margin;
  ContainerImages({
    this.imageurl,
    this.height,
    this.widths,
    this.borderRadius,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150,
      width: widths ?? 100,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      ),
      child: (imageurl != null)
          ? Image.network(
              imageurl!,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/landscape.png',
              fit: BoxFit.fill,
            ),
    );
  }
}
