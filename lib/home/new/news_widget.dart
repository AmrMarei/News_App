import 'package:flutter/material.dart';
import 'package:new_app/api/api_manager.dart';
import 'package:new_app/home/new/news_item.dart';
import 'package:new_app/model/SourceResponse.dart';

import '../../app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });
  }
}
