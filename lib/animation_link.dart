import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widget/text_widget.dart';

class Animationlink extends GetResponsiveView {
  final void Function() onTap;
  final String title;

  Animationlink({
    required this.title,
    required this.onTap,
  });

  @override
  Widget? phone() {
    return _Body(
      onTap: onTap,
      title: title,
      paddingLeft: 8,
      paddingLeftAnimation: 5,
    );
  }

  @override
  Widget? tablet() {
    return _Body(
      onTap: onTap,
      title: title,
      paddingLeft: 14,
      paddingLeftAnimation: 10,
    );
  }

  @override
  Widget? desktop() {
    return _Body(
      onTap: onTap,
      title: title,
      paddingLeft: 20,
      paddingLeftAnimation: 15,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.onTap,
    required this.title,
    required this.paddingLeft,
    required this.paddingLeftAnimation,
  }) : super(key: key);

  final String title;
  final void Function() onTap;
  final double paddingLeft, paddingLeftAnimation;

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (mouseHover) => InkWell(
        onTap: onTap,
        onHover: (ishover) {
          mouseHover.value = ishover;
        },
        child: Container(
          padding: EdgeInsets.only(
            left: mouseHover.value ? paddingLeft : paddingLeftAnimation,
            top: 1,
            bottom: 1,
          ),
          decoration: mouseHover.value
              ? BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                )
              : null,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              TextWidget(
                title,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
      false.obs,
    );
  }
}
