import 'package:flutter/material.dart';
import 'package:shared_widget/text_widget.dart';

import 'button_widget.dart';

class AppDialog extends StatelessWidget {
  final String title, cancelText, confirmText;
  final Color bgColor;
  final void Function() onConfirmTap;
  final void Function() onCancelTap;
  final Widget child;
  final double width;

  const AppDialog({
    Key? key,
    required this.title,
    required this.width,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirmTap,
    required this.onCancelTap,
    required this.bgColor,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: bgColor,
                ),
                child: Center(
                  child: TextWidget(
                    title,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SingleChildScrollView(child: child),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(
                  8.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        onTap: onConfirmTap,
                        hieght: 32.0,
                        title: confirmText,
                        titleColor: Colors.white,
                        color: bgColor,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: ButtonWidget(
                        onTap: onCancelTap,
                        hieght: 32.0,
                        title: cancelText,
                        titleColor: bgColor,
                        color: Colors.white,
                        border: Border.all(
                          color: bgColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
