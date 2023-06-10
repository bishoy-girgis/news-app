import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class GridViewItemWidget extends StatelessWidget {
  CategoryModel categoryModel;
  Function onClicked;
  int index;

  GridViewItemWidget({required this.categoryModel, required this.index,required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomRight: index % 2 == 0
                    ? const Radius.circular(0)
                    : const Radius.circular(25),
                bottomLeft: index % 2 == 0
                    ? const Radius.circular(25)
                    : const Radius.circular(0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 5,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
