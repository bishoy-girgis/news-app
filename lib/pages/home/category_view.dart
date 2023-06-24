import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/home/tabbar_listview.dart';
import 'package:news_app/pages/home/widgets/tab_item.dart';
import 'package:news_app/shared_components/network/api_manager.dart';

import '../../model/source_model.dart';
import '../../model/source_model.dart';

class CategoryView extends StatefulWidget {
  CategoryModel SelectedCategory;
  String? query;
  CategoryView({required this.SelectedCategory,this.query});

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
    return FutureBuilder<SourceModel>(
      future: fetchSources,
      builder: (context, snapshot) {
        SourceModel? Source = snapshot.data;
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 300,),
                Text(
                  "Error occurred: ${snapshot.error}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                    onPressed: () {
                      fetchSources;
                    },
                    icon: const Icon(Icons.refresh_outlined))
              ],
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return TabBarListView(Source!,widget.query!);
      },
    );
  }
}
