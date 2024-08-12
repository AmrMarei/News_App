import 'package:flutter/material.dart';
import 'package:new_app/home/category/category_item.dart';

import '../../model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.pickYourCategoryOfInterest,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
