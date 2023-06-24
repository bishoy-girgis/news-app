import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/pages/home/articls_listview.dart';
import 'package:news_app/pages/home/widgets/tab_item.dart';

import '../../shared_components/theme/color.dart';

class TabBarListView extends StatefulWidget {
  SourceModel sourceModel;
String query;
  TabBarListView(this.sourceModel,this.query);

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return widget.sourceModel.sources?.isNotEmpty?? true ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
            initialIndex: selectedIndex,
            length: widget.sourceModel.sources?.length ?? 0,
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 7),
              indicator: const BoxDecoration(),
              isScrollable: true,
              onTap: (index) {
                setState(() {
                  selectedIndex=index;
                });
              },
              tabs: widget.sourceModel.sources?.map((e) => TabItem(e,selectedIndex==widget.sourceModel.sources?.indexOf(e))).toList() ?? [],
            ),
          ),
         ArticlesListView(widget.sourceModel.sources?[selectedIndex].id ?? "",widget.query),
        ],
      ),
    )
    : Center(
      child: Text("Sorry there is no articles now \n try another Category ...",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor),
        textAlign: TextAlign.center,),
    );
  }
}
