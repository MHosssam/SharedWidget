import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:shared_widget/text_widget.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: DropdownButton<Locale>(
        value: Localizations.maybeLocaleOf(context),
        items: [
          DropdownMenuItem<Locale>(
            child: TextWidget('English'),
            value: Locale('en'),
          ),
          DropdownMenuItem<Locale>(
            child: TextWidget('العربية'),
            value: Locale('ar'),
          ),
        ],
        // S.delegate.supportedLocales
        //     .map(
        //       (e) => DropdownMenuItem<Locale>(
        //         child: TextWidget(
        //           e.languageCode == 'ar' ? 'العربية' : 'English',
        //         ),
        //         value: e,
        //       ),
        //     )
        //     .toList(),
        isDense: true,
        onChanged: (value) async {
          if (value != null) {
            // await CacheService.to.metaRepo.setLocale(
            //   value.languageCode,
            //   andUpdateApp: true,
            // );
          }
        },
      ),
    );
  }
}
