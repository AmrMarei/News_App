import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/app_colors.dart';
import 'package:new_app/home/setting/settings.dart';
import 'package:new_app/model/category.dart';

import 'category/category_details.dart';
import 'category/category_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routNme='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/image/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuItem == HomeDrawer.settings
                  ? AppLocalizations.of(context)!.settings
                  : selectedCategory == null
                      ? AppLocalizations.of(context)!.newsApp
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? SettingTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
