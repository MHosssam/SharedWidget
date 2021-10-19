import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text_widget.dart';

class AppExpansionTile extends StatelessWidget {
  const AppExpansionTile({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (isOpen) => Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isOpen.value
              ? context.theme.colorScheme.onPrimary
              : context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: context.theme.colorScheme.primary,
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
                    color: isOpen.value
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    width: 25,
                    height: 20,
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(end: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: isOpen.value
                          ? context.theme.colorScheme.primary
                          : context.theme.colorScheme.onPrimary,
                    ),
                    child: InkWell(
                      onTap: () {
                        isOpen.value = !isOpen.value;
                      },
                      child: Icon(
                        isOpen.value ? Icons.expand_less : Icons.expand_more,
                        color: isOpen.value
                            ? context.theme.colorScheme.onPrimary
                            : context.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: context.theme.colorScheme.primary,
            ),
            if (isOpen.value) children,
          ],
        ),
      ),
      false.obs,
    );
  }
}
