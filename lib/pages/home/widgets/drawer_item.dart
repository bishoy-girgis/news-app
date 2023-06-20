import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String title;
  Function onClick;
  IconData iconData;

  DrawerItem(
      {required this.title, required this.iconData, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
              size: 35,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
