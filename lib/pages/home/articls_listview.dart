import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/pages/home/news-list-view-model.dart';
import 'package:news_app/pages/home/widgets/article_view_item.dart';
import 'package:news_app/shared_components/network/api_manager.dart';

import '../../shared_components/theme/color.dart';

class ArticlesListView extends StatelessWidget {
  String sourceId;
  String query;

  ArticlesListView(this.sourceId, this.query);

  late Future<ArticlesModel> fetchArticles;
  var viewModel = NewsListViewModel();


  @override
  Widget build(BuildContext context) {
    viewModel.loadArticles(sourceId);
    return BlocBuilder<NewsListViewModel, NewsListViewState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
              child: Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 50,
              ),
              Text(state.loadingMessage ?? ""),
            ],
          ));
        }
        if (state is ErrorState) {
          return Column(
            children: [
              Text(
                "Error occurred: ${state.errorMessage}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              IconButton(
                  onPressed: () {
                    viewModel;
                  }, icon: const Icon(Icons.refresh_outlined))
            ],
          );
        }
        if (state is SuccessState) {
          var articlesList = state.articles;
          if (articlesList.isEmpty) {
            return Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  "Sorry there is no articles now \n try another source ...",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ArticleView(articlesList[index]);
                },
                itemCount: articlesList.length,
              ),
            );
          }
        }
        return Container();
      },
    );
    /*
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
              const SizedBox(height: 200,),
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

     */
  }
}
