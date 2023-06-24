import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/pages/details_screen/details_screen.dart';

class ArticleView extends StatelessWidget {
  Articles articles;

  ArticleView(this.articles);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,arguments:articles );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(18),
            //   child: CachedNetworkImage(
            //     imageUrl: articles.urlToImage ?? "",
            //     placeholder: (context, url) => const CircularProgressIndicator(),
            //     errorWidget: (context, url, provider) =>const Icon(Icons.error),
            //   ),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(articles.urlToImage ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                articles.source?.name ?? "",
                style: theme.textTheme.bodySmall
                    ?.copyWith(fontSize: 14, color: const Color(0XFF79828B)),
              ),
            ),
            Text(
              articles.title ?? "",
              style: theme.textTheme.bodySmall
                  ?.copyWith( color: const Color(0XFF42505C)),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                formatTimeAgo(articles.publishedAt?? ""),
                style: theme.textTheme.bodySmall
                    ?.copyWith(fontSize: 14, color: const Color(0XFFA3A3A3)),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTimeAgo(String timePublished) {
    final parsedPublishedTime = DateTime.parse(timePublished).toLocal();
    final now = DateTime.now();
    final difference = now.difference(parsedPublishedTime);

    if (difference.inDays >= 1) {
      return DateFormat.yMMMd().format(parsedPublishedTime);
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
