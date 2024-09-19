import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';

import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  String _getFlagEmoji(String countryCode) {
    return switch(countryCode){
      'en' => "🇬🇧",
      'it' => "🇮🇹",
       _ => "🇺🇸"
    };
  }

  String _getLanguageName(AppLocale locale) {
    return switch (locale) {
      AppLocale.en => 'English',
      AppLocale.it => 'Italiano',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height / 3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
          ],
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopBottomSheetWidget(),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.language_rounded, size: 20,),
                Gap.SM_H,
                Text(
                  t.profile.settings.general.languages.select_language,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: AppLocale.values.length,
              itemBuilder: (context, index) => RadioListTile<AppLocale>(
                visualDensity: VisualDensity.compact,
                value: AppLocale.values[index],
                groupValue: TranslationProvider.of(context).locale,
                title: Text('${_getFlagEmoji(AppLocale.values[index].languageCode)} ${_getLanguageName(AppLocale.values[index])}', style: Theme.of(context).textTheme.bodyMedium,),
                onChanged: (AppLocale? newLocale) => LocaleSettings.setLocale(newLocale ?? AppLocale.en),
              ),
              separatorBuilder: (_, __) => const Divider(),
            )
          ],
        ));
  }
}
