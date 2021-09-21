import 'package:flutter/material.dart';

import 'button_widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.mainColor,
  }) : super(key: key);
  final void Function() onTap;
  final String title;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: ButtonWidget(
          title: title,
          onTap: onTap,
          textAlign: TextAlign.center,
          color: mainColor,
          titleColor: Colors.white,
        ),
      ),
    );
  }
}
