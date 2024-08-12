import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';
import 'language_button_sheet.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.blackColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                showLanguageButtonSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blackColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageButtonSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => languageButtonSheet());
  }
}
