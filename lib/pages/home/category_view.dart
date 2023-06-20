import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/shared_components/network/api_manager.dart';

import '../../model/source_model.dart';
import '../../model/source_model.dart';

class CategoryView extends StatefulWidget {
  CategoryModel SelectedCategory;

  CategoryView({required this.SelectedCategory});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<SourceModel> fetchSources;

  @override
  void initState() {
    fetchSources = ApiManager.fetchSources(widget.SelectedCategory.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<SourceModel>(
        future: fetchSources,
        builder: (context, snapshot) {
          SourceModel? Source = snapshot.data;
          if (snapshot.hasError) {
            print("Error occurred: ${snapshot.error}");
            return Text(
              "Error occurred",
              style: Theme.of(context).textTheme.bodySmall,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
             return const CircularProgressIndicator();
           }
          return ListView.builder(
            itemBuilder: (context, index) => Text(
                Source?.sources?[index].name ?? "",
                style: Theme.of(context).textTheme.bodySmall),
            itemCount: Source?.sources?.length ?? 0,
          );
        },
      ),
    );
  }
}
