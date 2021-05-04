import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:forrira/models/item.dart';
import 'package:forrira/providers/items.dart';
import 'package:provider/provider.dart';

import 'dept_contents_item.dart';

class DeptContentGrid extends StatelessWidget {
  // final List<Item> listy;
  final String deptid;
  DeptContentGrid(this.deptid);
  @override
  Widget build(BuildContext context) {
    List<Item> fromCLass = Provider.of<Data>(context).items;
    List<Item> listy =
        fromCLass.where((element) => element.dept == deptid).toList();

    int columnCount = 2;
//     return GridView(
//       shrinkWrap: true,
//       primary: true,
//       physics: scroll,
//       padding: const EdgeInsets.all(8),
//       children: listy
//           .map((item) => DeptContentsItem(
//                 item.id,
//                 item.title,
//                 item.image,
//                 item.price,
//                 item.dept,
//                 item.can,
//               ))
//           .toList(),
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         childAspectRatio: 1 / 1.4,
//         crossAxisSpacing: 5,
//         mainAxisSpacing: 20,
//       ),
//     );
//   }
// }

    return AnimationLimiter(
      child: GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 8,
        childAspectRatio: 1 / 1.4,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(5),
        crossAxisCount: columnCount,
        children: List.generate(
          listy.length,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: Duration(milliseconds: 500),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                //scale: 1.5,
                child: FadeInAnimation(
                    child: DeptContentsItem(
                  listy[index].id,
                  listy[index].title,
                  listy[index].image,
                  listy[index].price,
                  listy[index].dept,
                  listy[index].can,
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
