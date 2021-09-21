import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:shared_widget/text_widget.dart';

import 'services/navigation_service.dart';

class AppbarWidget extends AppBar {
  AppbarWidget({
    Key? key,
    Widget? leadingWidget,
    Widget? titleWidget,
    Widget? flexibleSpaceWidget,
    Color? leadingIconColor,
    Color? titleColor,
    bool? showMenu,
    String? titleText,
    List<Widget>? actions,
    void Function()? onActionTap,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
    TextOverflow? textOverflow,
    bool? centerTitle,
    int? maxLines = 1,
    double? appBarElevation,
  }) : super(
          key: key,
          bottom: bottom,
          leading: leadingWidget ??
              (showMenu == true
                  ? InkWell(
                      onTap: onActionTap ??
                          () {
                            NavigationService.to.drawerKey.currentState?.open(
                              direction: InnerDrawerDirection.start,
                            );
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.apps,
                          size: 34,
                          color: leadingIconColor ?? Colors.black,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () => Get.rootDelegate.popRoute(
                        popMode: PopMode.History,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: leadingIconColor ?? Colors.black,
                        ),
                      ),
                    )),
          title: titleWidget ??
              TextWidget(
                titleText ?? '',
                color: titleColor ?? Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                textOverflow: textOverflow,
                maxLines: maxLines,
              ),
          actions: actions,
          centerTitle: centerTitle ?? true,
          flexibleSpace: flexibleSpaceWidget,
          backgroundColor: backgroundColor ?? Colors.grey,
          elevation: appBarElevation ?? 0.0,
        );
}
