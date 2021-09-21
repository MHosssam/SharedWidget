import 'package:flutter/material.dart';

import '../text_widget.dart';

class DrawerItem extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Function()? onTap;
  final bool isSelected;
  final Color mainColor;

  const DrawerItem({
    Key? key,
    this.title,
    this.iconData,
    this.onTap,
    required this.isSelected,
    required this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isSelected ? mainColor : Colors.grey,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: isSelected ? Colors.grey : mainColor,
                size: 34,
              ),
              TextWidget(
                title,
                color: isSelected ? Colors.grey : mainColor,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
