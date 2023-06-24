import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/category_view.dart';
import 'package:news_app/pages/home/widgets/article_view_item.dart';
import 'package:news_app/pages/home/widgets/drawer_widget.dart';
import 'package:news_app/pages/home/widgets/gridview_item_widget.dart';
import 'package:news_app/pages/setting/setting_page.dart';
import 'package:news_app/shared_components/theme/color.dart';
import '../../model/articles_model.dart';
import '../../model/category_model.dart';
import '../../shared_components/network/api_manager.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
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
    TextEditingController controller=TextEditingController();

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
            title: isSearch
                ? TextField(
                    controller: controller,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch=false;
                              controller.text="";

                            });
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          icon: const Icon(
                            Icons.search,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                        hintText: "Search Article ...",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true),
                  )
                : Text(
                    SelectedCategory == null
                        ? "News App"
                        : "${SelectedCategory?.title}",
                    style: Theme.of(context).textTheme.bodyMedium),
            actions: !isSearch
                ? SelectedCategory != null
                    ? [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isSearch=true;
                              });
                              // showSearch(
                              //     context: context,
                              //     delegate: NewsSearchDelegate());
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 26,
                            )),
                        const SizedBox(
                          width: 5,
                        )
                      ]
                    : null
                : null,
          ),
          drawer: isSearch
              ? null
              : DrawerWidget(
                  SelectedCategory: SelectedCategory,
                  onCategoryPressed: categoryPreseed,
                  onSettingPressed: settingPressed),
          body: buildBody()),
    );
  }

  CategoryModel? SelectedCategory;
  CategoryModel Setting = CategoryModel(
      id: "",
      title: "Settings",
      backgroundColor: Colors.transparent,
      image: "");

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
        query: controller.text,
      );
    }
  }
}

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.clear,
            color: primaryColor,
            size: 20,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      color: primaryColor,
      iconSize: 20,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return FutureBuilder<ArticlesModel>(
      future: ApiManager.fetchArticles(q: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                "Error occurred: ${snapshot.error}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.refresh_outlined))
            ],
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        var articlesList = snapshot.data?.articles ?? [];
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/background_pattern.png"),
                  fit: BoxFit.cover)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ArticleView(articlesList[index]);
            },
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background_pattern.png"),
              fit: BoxFit.cover)),
      child: Center(
          child: Text(
        "suggestions",
        style: Theme.of(context).textTheme.headlineMedium,
      )),
    );
  }
}
