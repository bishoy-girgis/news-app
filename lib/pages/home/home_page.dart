import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/drawer_widget.dart';
import 'package:news_app/pages/home/widgets/gridview_item_widget.dart';

import '../../model/category_model.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "Sports",
      title: "Sports",
      backgroundColor: const Color(0XFFC91C22),
      image: "assets/images/sports_icon.png",
    ),
    CategoryModel(
      id: "Politics",
      title: "Politics",
      backgroundColor: const Color(0XFF003E90),
      image: "assets/images/Politics_icon.png",
    ),
    CategoryModel(
      id: "Health",
      title: "Health",
      backgroundColor: const Color(0XFFED1E79),
      image: "assets/images/health_icon.png",
    ),
    CategoryModel(
      id: "Business ",
      title: "Business ",
      backgroundColor: const Color(0XFFCF7E48),
      image: "assets/images/bussines_icon.png",
    ),
    CategoryModel(
      id: "Enviroment",
      title: "Enviroment",
      backgroundColor: const Color(0XFF4882CF),
      image: "assets/images/environment_icon.png",
    ),
    CategoryModel(
      id: "Science",
      title: "Science",
      backgroundColor: const Color(0XFFF2D352),
      image: "assets/images/science_icon.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background_pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              SelectedCategory == null
                  ? "News App"
                  : "${SelectedCategory?.title}",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        drawer: DrawerWidget(SelectedCategory: SelectedCategory),
        body: SelectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 8 / 9,
                                crossAxisCount: 2,
                                crossAxisSpacing: 17,
                                mainAxisSpacing: 15),
                        itemBuilder: (context, index) => GridViewItemWidget(
                          categoryModel: categoriesList[index],
                          index: index,
                          onClicked: clicked,
                        ),
                        itemCount: categoriesList.length,
                      ),
                    )
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  CategoryModel? SelectedCategory;

  clicked(CategoryModel categoryModel) {
    print("hello baby--->> ${categoryModel.title}");
    SelectedCategory = categoryModel;
    setState(() {});
  }
}
