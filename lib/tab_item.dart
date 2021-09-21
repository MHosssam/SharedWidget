import 'package:flutter/material.dart';

import 'text_widget.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onTap,
    required this.mainColor,
    required this.secondColor,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final Function() onTap;
  final Color mainColor, secondColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: isSelected ? mainColor : secondColor,
        ),
        child: TextWidget(
          title,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isSelected ? secondColor : mainColor,
        ),
      ),
    );
  }
}
