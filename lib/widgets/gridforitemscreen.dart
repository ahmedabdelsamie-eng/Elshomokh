import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forrira/models/item.dart';
import 'package:forrira/providers/items.dart';
import 'package:provider/provider.dart';

import 'dept_contents_item.dart';

class GridForItemScreen extends StatelessWidget {
  final String deptid;
  final NeverScrollableScrollPhysics scroll;
  GridForItemScreen(this.deptid, {this.scroll});
  @override
  Widget build(BuildContext context) {
    List<Item> fromCLass = Provider.of<Data>(context).items;
    List<Item> listy =
        fromCLass.where((element) => element.dept == deptid).toList();

    return GridView(
      shrinkWrap: true,
      primary: true,
      physics: scroll,
      padding: const EdgeInsets.all(8),
      children: listy
          .map((item) => DeptContentsItem(
                item.id,
                item.title,
                item.image,
                item.price,
                item.dept,
                item.can,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 1.4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 20,
      ),
    );
  }
}
