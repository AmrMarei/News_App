import 'package:flutter/material.dart';
import 'package:new_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;

  /*
       technology
   */
  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/image/sports.png',
          color: AppColors.redColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/image/health.png',
          color: AppColors.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/image/bussines.png',
          color: AppColors.brownColor),
      Category(
          id: 'entertainment',
          title: 'Environment',
          imagePath: 'assets/image/environment.png',
          color: AppColors.blueColor),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/image/science.png',
          color: AppColors.yellowColor),
      Category(
          id: 'technology',
          title: 'Politics',
          imagePath: 'assets/image/Politics.png',
          color: AppColors.darkBlueColor),
    ];
  }
}
