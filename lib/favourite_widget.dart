import 'package:flutter/material.dart';

class FavouriteWidget extends StatelessWidget {
  final bool isFavorite;
  final void Function() favTap;
  final double? iconSize;
  final double? width, height;
  const FavouriteWidget({
    Key? key,
    required this.isFavorite,
    required this.favTap,
    this.iconSize,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: width ?? 40,
      height: height ?? 25,
      decoration: new BoxDecoration(
        color: isFavorite ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: favTap,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.white : Colors.red,
          size: iconSize ?? 27,
        ),
      ),
    );
  }
}
