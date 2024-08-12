import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/model/NewResponse.dart';

import '../../app_colors.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    // Format to show only the time
    String formattedTime = '';
    if (news.publishedAt != null) {
      DateTime dateTime = DateTime.parse(news.publishedAt!);
      formattedTime =
          DateFormat('jm').format(dateTime); // Displays time like: 02:30 PM
    }

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.greyColor),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 12,
          ),
          Text(formattedTime,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
