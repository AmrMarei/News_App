import 'package:flutter/material.dart';
import 'package:new_app/app_colors.dart';

import '../../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 2,
        ),
        color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.primaryLightColor,
            ),
      ),
    );
  }
}
