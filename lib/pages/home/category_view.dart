import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/home/category_view_model.dart';
import 'package:news_app/pages/home/tabbar_listview.dart';
import 'package:news_app/pages/home/widgets/tab_item.dart';
import 'package:news_app/shared_components/network/api_manager.dart';
import '../../model/source_model.dart';
import '../../model/source_model.dart';

class CategoryView extends StatelessWidget {
  CategoryModel SelectedCategory;
  String? query;

  CategoryView({required this.SelectedCategory, this.query});

  // late Future<SourceModel> fetchSources;
  var viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loadNewsSources(SelectedCategory.id);
    return BlocBuilder<CategoryViewModel, CategoryViewState>(
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
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                Text(
                  "Error occurred: ${state.errorMessage}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                    onPressed: () {
                      viewModel;
                    },
                    icon: const Icon(Icons.refresh_outlined))
              ],
            ),
          );
        }
        if (state is SuccessState) {
          List<Source> Sources = state.sources.cast<Source>();
          return TabBarListView(Sources,query!);
        }
        return Container();
      },
    );
    /*
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

     */
  }
}
