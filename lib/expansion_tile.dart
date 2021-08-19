import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mini_divider.dart';
import 'text_widget.dart';

class ExpansionTile extends StatelessWidget {
  const ExpansionTile({
    Key? key,
    required this.title,
    required this.controller,
    required this.children,
    required this.mainColor,
    required this.secondColor,
  }) : super(key: key);
  final String title;
  final controller;
  final Widget children;
  final Color mainColor, secondColor;

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (isOpen) => Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isOpen.value ? secondColor : mainColor,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: mainColor,
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title,
                    fontSize: 18,
                    color: isOpen.value ? mainColor : secondColor,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    width: 25,
                    height: 20,
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(end: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: isOpen.value ? mainColor : secondColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        isOpen.value = !isOpen.value;
                      },
                      child: Icon(
                        isOpen.value ? Icons.expand_less : Icons.expand_more,
                        color: isOpen.value ? secondColor : mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MiniDivider(
              height: 0.5,
              color: mainColor,
            ),
            if (isOpen.value) children,
          ],
        ),
      ),
      false.obs,
    );
  }
}
