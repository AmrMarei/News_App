import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';

class languageButtonSheet extends StatefulWidget {
  @override
  State<languageButtonSheet> createState() => _languageButtonSheetState();
}

class _languageButtonSheetState extends State<languageButtonSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      color: AppColors.primaryLightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : unSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 24,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : unSelectedItemWidget(AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.yellowColor),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: AppColors.yellowColor,
        )
      ],
    );
  }

  Widget unSelectedItemWidget(String text) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
