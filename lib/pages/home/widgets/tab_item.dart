import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared_components/theme/color.dart';

import '../../../model/source_model.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          border: Border.all(color: primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(24)),
      child: Text(source.name ?? "",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 18,
                color: isSelected ? Colors.white : primaryColor,
              )),
    );
  }
}
