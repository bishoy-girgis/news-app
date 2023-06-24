import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/pages/home/widgets/article_view_item.dart';
import 'package:news_app/shared_components/network/api_manager.dart';

import '../../shared_components/theme/color.dart';

class ArticlesListView extends StatelessWidget {
  String sourceId;
  String query;
  ArticlesListView(this.sourceId,this.query);

  late Future<ArticlesModel> fetchArticles;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesModel>(
      future: ApiManager.fetchArticles(source: sourceId,q: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                "Error occurred: ${snapshot.error}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.refresh_outlined))
            ],
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        var articlesList = snapshot.data?.articles ?? [];
        if(articlesList.isEmpty){
          return Column(
            children: [
              const SizedBox(height: 250,),
              Text("Sorry there is no articles now \n try another source ...",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor),
                textAlign: TextAlign.center,),
            ],
          );
        }else {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ArticleView(articlesList[index]);
            },
            itemCount:articlesList.length,
          ),
        );}
      },
    );
  }

}
