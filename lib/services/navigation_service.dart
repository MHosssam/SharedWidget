import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';

//this used device language
// final locale =  Get.deviceLocale!.languageCode.obs;

class NavigationService extends GetxService {
  static NavigationService get to => Get.find();
  final drawerKey = GlobalKey<InnerDrawerState>();
  final locale = Get.deviceLocale!.languageCode.obs;
  final locales = ['en', 'ar'];
}
