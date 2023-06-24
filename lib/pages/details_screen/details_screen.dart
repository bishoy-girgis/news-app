import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/pages/details_screen/web_view.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details screen";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background_pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            article.title ?? "",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // CachedNetworkImage(
                //   placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) =>const Center(child: Icon(Icons.error,color: Colors.red,)),
                //   imageUrl: article.urlToImage??"",
                //   height: 150,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // )
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(article.urlToImage ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    article.source?.name ?? "",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14, color: const Color(0XFF79828B)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 18, color: const Color(0XFF42505C)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    formatTimeAgo(article.publishedAt ?? ""),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14, color: const Color(0XFFA3A3A3)),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.description ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, WebView.routeName,arguments: article);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View Full Article",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(
                          CupertinoIcons.play_arrow_solid,
                          color: Colors.black,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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
