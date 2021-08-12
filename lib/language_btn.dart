import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
// import 'package:inhouse_steak/generated/l10n.dart';

class LanguageBtn extends StatelessWidget {
  final locale = 'ar'.obs;
  // TODO:
  //this used device language
  // final locale =  Get.deviceLocale!.languageCode.obs;

  final locales = ['en', 'ar'];
  final Color mainColor;

  LanguageBtn({
    Key? key,
    required this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          margin: EdgeInsetsDirectional.only(end: 8.0),
          child: ToggleSwitch(
            minHeight: 30.0,
            minWidth: 50.0,
            activeBgColor: [
              mainColor,
            ],
            totalSwitches: 2,
            inactiveBgColor: Colors.black,
            activeFgColor: Colors.black,
            inactiveFgColor: Colors.white,
            initialLabelIndex: locales.indexOf(locale.value),
            labels: locales,
            onToggle: (index) {
              locale.value = locales[index];

              ///TODO:
              // S.load(
              //   Locale(locale.value),
              // );
              Get.updateLocale(
                Locale(locale.value),
              );
            },
          ),
        );
      },
    );
  }
}
