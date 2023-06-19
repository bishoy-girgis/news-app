import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/home/widgets/drawer_item.dart';
import 'package:news_app/shared_components/theme/color.dart';

class DrawerWidget extends StatelessWidget {
  CategoryModel? SelectedCategory;
  Function? onCategoryPressed;
  Function? onSettingPressed;
  DrawerWidget({required this.SelectedCategory, required this.onCategoryPressed,required this.onSettingPressed
  });
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaquery.width * 0.75,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: mediaquery.height * 0.2,
              color: primaryColor,
              child: Text(
                "News App!",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
              title: "Categories",
              iconData: Icons.list_alt_outlined,
              onClick: () {
               if(onCategoryPressed!=null){
                 onCategoryPressed!();
               }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            DrawerItem(
              title: "Settings",
              iconData: Icons.settings,
              onClick: () {
                if(onSettingPressed!=null){
                  onSettingPressed!();
                }
                // to do call back function
              },
            ),
          ],
        ),
      ),
    );
  }
}
