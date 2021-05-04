import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:forrira/providers/cart.dart';
import 'package:forrira/widgets/cart_screen_item.dart';

class CartList extends StatelessWidget {
  final List<CartItem> listy;
  CartList({this.listy});
  @override
  Widget build(BuildContext context) {
    //print(toshow.length);
    print('3333333333333333333333333333');
    // print(listy[0].dept);
    // print(listy[0].dadId);
    // print(listy[0].id);
    // print(listy[0].title);
    // print(listy[0].price);

    // print(listy.length);
    return AnimationLimiter(
      child: ListView.builder(
          itemCount: listy.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 700),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: CArtScreenItem(
                    id: listy[index].id,
                    title: listy[index].title,
                    price: listy[index].price,
                    boughtCan: listy[index].boughtCan,
                    dept: listy[index].dept,
                    image: listy[index].image,
                    //item.quantity,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
