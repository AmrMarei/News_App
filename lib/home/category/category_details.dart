import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/model/category.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../../model/SourceResponse.dart';
import '../tabs/tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(AppLocalizations.of(context)!.somethingWentWrong),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                    },
                    child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources!;
          return TabsWidget(sourcesList: sourcesList);
        });
  }
}
