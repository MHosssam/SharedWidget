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
        image: DecorationImage(
          image: NetworkImage(
            imageurl != null
                ? imageurl!
                : 'https://musclemakergrillkw.com/wp-content/uploads/woocommerce-placeholder.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
//