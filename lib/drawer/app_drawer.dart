import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widget/services/navigation_service.dart';

import 'selected_item.dart';

class RoutedDrawerItem {
  final String title;
  final String? route;
  final IconData iconData;
  final void Function()? onTap;
  final bool Function(GetNavConfig? route)? isSelected;
  RoutedDrawerItem({
    this.onTap,
    required this.iconData,
    required this.title,
    this.isSelected,
    this.route,
  });
}

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  void navigateGlobal(String route) {
    NavigationService.to.drawerKey.currentState?.close();
    Get.rootDelegate.toNamed(route);
  }

  final drawerItems = <RoutedDrawerItem>[
    //ex:
    // RoutedDrawerItem(
    //   title: 'الصفحه الرئيسيه',
    //   route: Routes.HOME_ROOT,
    //   isSelected: (route) =>
    //       route == null ||
    //       route.location == Routes.HOME ||
    //       route.currentTreeBranch.pickAfterRoute(Routes.HOME_ROOT).isEmpty,
    //   iconData: Icons.home_outlined,
    // ),
    // RoutedDrawerItem(
    //   title: 'ملاحظاتي',
    //   route: Routes.NOTES,
    //   iconData: Icons.note_outlined,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // header drawer
          Container(),
          //list of tap item
          Expanded(
            child: SingleChildScrollView(
              child: GetRouterOutlet.builder(
                builder: (context, delegate, currentRoute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var item in drawerItems)
                      DrawerItem(
                        mainColor: Colors.red,
                        isSelected: item.isSelected?.call(currentRoute) ??
                            (item.route != null &&
                                currentRoute?.location
                                        ?.startsWith(item.route!) ==
                                    true),
                        title: item.title,
                        iconData: item.iconData,
                        onTap: item.onTap ??
                            () {
                              navigateGlobal(item.route!);
                            },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/**
 * //Ex: page use drawer
 * 
 * return GetRouterOutlet.builder(
      builder: (context, delegete, route) {
        return InnerDrawer(
          key: NavigationService.to.drawerKey,
          onTapClose: true,
          swipe: true,
          backgroundDecoration: BoxDecoration(
            color: Colors.grey,
          ),
          colorTransitionChild: AppUi.colors.mainColor,
          offset: const IDOffset.only(bottom: 0.05, right: 0.0, left: 0.1),
          scale: const IDOffset.horizontal(0.8),
          borderRadius: 25,
          rightAnimationType: InnerDrawerAnimation.quadratic,
          leftChild: AppDrawer(),
          scaffold: GetRouterOutlet(
            initialRoute: Routes.HOME,
            anchorRoute: Routes.HOME_ROOT,
            key: Get.nestedKey(Routes.HOME_ROOT),
            delegate: delegete,
          ),
        );
      },
    );
 */