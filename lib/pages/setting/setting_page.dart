import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/setting/widgets/language_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/setting_provider.dart';
import '../../shared_components/theme/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showBottomLanguageSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.7,
                      color: primaryColor,
                      style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingsProvider.currentLocal == "en"
                        ? AppLocalizations.of(context)!.languageEnglish
                        : AppLocalizations.of(context)!.languageArabic,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 33,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageWidget());
  }
}
