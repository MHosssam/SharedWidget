import 'package:flutter/material.dart';
import 'package:shared_widget/text_widget.dart';

import 'button_widget.dart';

const radius16 = BorderRadius.only(
  topLeft: Radius.circular(16.0),
  topRight: Radius.circular(16.0),
);

class AppDialog extends StatelessWidget {
  final String title;
  final String? confirmText, cancelText;
  final Color bgColor;
  final void Function()? onConfirmTap;
  final void Function()? onCancelTap;
  final Widget child;
  final double width;
  final ScrollPhysics? physics;
  const AppDialog({
    Key? key,
    this.physics,
    required this.title,
    required this.width,
    this.confirmText = 'تأكيد',
    this.cancelText = 'إلغاء',
    this.onConfirmTap,
    this.onCancelTap,
    required this.bgColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: radius16),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        physics: physics,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: bgColor,
              ),
              child: Center(
                child: TextWidget(
                  title,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            child,
            const SizedBox(
              height: 20,
            ),
            if (cancelText != null || confirmText != null)
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Row(
                  children: [
                    if (cancelText != null)
                      Expanded(
                        child: ButtonWidget(
                          onTap: onCancelTap,
                          hieght: 40.0,
                          title: cancelText,
                          titleColor: bgColor,
                          color: Colors.white,
                        ),
                      ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    if (confirmText != null)
                      Expanded(
                        child: ButtonWidget(
                          onTap: onConfirmTap,
                          hieght: 40.0,
                          title: confirmText,
                          titleColor: Colors.white,
                          color: bgColor,
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
