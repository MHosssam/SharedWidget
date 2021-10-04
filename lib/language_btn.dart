import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widget/services/navigation_service.dart';
import 'package:toggle_switch/toggle_switch.dart';
// import 'package:inhouse_steak/generated/l10n.dart';

class LanguageBtn extends StatelessWidget {
  final Color mainColor;

  LanguageBtn({
    Key? key,
    required this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ToggleSwitch(
        minHeight: 30.0,
        minWidth: 50.0,
        activeBgColor: [
          Colors.orange,
        ],
        totalSwitches: 2,
        inactiveBgColor: Colors.grey,
        activeFgColor: Colors.black,
        inactiveFgColor: Colors.white,
        // initialLabelIndex:
        //     LanguageService.to.locales.indexOf(LanguageService.to.currentLocal),
        // labels: LanguageService.to.locales,
        onToggle: (index) {
          // LanguageService.to.setLocal(LanguageService.to.locales[index]);
        },
      ),
    );
  }
}
