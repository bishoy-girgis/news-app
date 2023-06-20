import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/category_view.dart';
import 'package:news_app/pages/home/widgets/drawer_widget.dart';
import 'package:news_app/pages/home/widgets/gridview_item_widget.dart';
import 'package:news_app/pages/setting/setting_page.dart';

import '../../model/category_model.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      backgroundColor: const Color(0XFFC91C22),
      image: "assets/images/sports_icon.png",
    ),
    CategoryModel(
      id: "politics",
      title: "Politics",
      backgroundColor: const Color(0XFF003E90),
      image: "assets/images/Politics_icon.png",
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      backgroundColor: const Color(0XFFED1E79),
      image: "assets/images/health_icon.png",
    ),
    CategoryModel(
      id: "business ",
      title: "Business ",
      backgroundColor: const Color(0XFFCF7E48),
      image: "assets/images/bussines_icon.png",
    ),
    CategoryModel(
      id: "enviroment",
      title: "Enviroment",
      backgroundColor: const Color(0XFF4882CF),
      image: "assets/images/environment_icon.png",
    ),
    CategoryModel(
      id: "science",
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
          drawer: DrawerWidget(
              SelectedCategory: SelectedCategory,
              onCategoryPressed: categoryPreseed,
              onSettingPressed: settingPressed),
          body: buildBody()),
    );
  }

  CategoryModel? SelectedCategory;
  CategoryModel Setting = CategoryModel(
      id: "", title: "Settings", backgroundColor: Colors.cyan, image: "");

  clicked(CategoryModel categoryModel) {
    SelectedCategory = categoryModel;
    setState(() {});
  }

  categoryPreseed() {
    setState(() {
      SelectedCategory = null;
      Navigator.pop(context);
    });
  }

  settingPressed() {
    setState(() {
      SelectedCategory = Setting;
      Navigator.pop(context);
    });
  }

  Widget buildBody() {
    if (SelectedCategory == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8 / 9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 11,
                ),
                itemBuilder: (context, index) => GridViewItemWidget(
                  categoryModel: categoriesList[index],
                  index: index,
                  onClicked: clicked,
                ),
                itemCount: categoriesList.length,
              ),
            ),
          ],
        ),
      );
    } else if (SelectedCategory == Setting) {
      return const SettingPage();
    } else {
      return CategoryView(
        SelectedCategory: SelectedCategory!,
      );
    }
  }
}
