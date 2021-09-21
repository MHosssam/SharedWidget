import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widget/text_widget.dart';

//anoimated text in home page at section 2
class ClickTextAnimation extends StatelessWidget {
  final void Function() onTap;
  final String? title;
  final IconData? iconData;

  const ClickTextAnimation({
    Key? key,
    required this.onTap,
    required this.title,
    this.iconData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (mouseHover) => InkWell(
        onTap: onTap,
        onHover: (ishover) {
          mouseHover.value = ishover;
        },
        child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          width: 300,
          padding: EdgeInsets.only(
            left: mouseHover.value ? 8 : 4,
            top: 5,
            bottom: 5,
          ),
          decoration: mouseHover.value
              ? BoxDecoration(
                  color: Color.fromRGBO(36, 36, 36, 0.4),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          child: Padding(
            padding: EdgeInsets.only(
              left: mouseHover.value ? 8 : 4,
              top: 1,
              bottom: 1,
            ),
            child: Row(
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: 20,
                  ),
                if (iconData != null) const SizedBox(width: 8),
                TextWidget(
                  title,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      false.obs,
    );
  }
}
