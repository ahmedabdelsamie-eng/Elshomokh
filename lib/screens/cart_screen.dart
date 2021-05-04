import 'package:flutter/material.dart';
import 'package:forrira/providers/cart.dart';
import 'package:forrira/widgets/cart_list.dart';
import 'package:provider/provider.dart';

class CArt extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // print('555555555555555555555555555555555');
    // final cartData = Provider.of<Cart>(context);
    // List<CartItem> toshow = cartData.cartlist;
    return Scaffold(
      appBar: AppBar(
        title: Text('CART'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  'Total :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Consumer<Cart>(
                  builder: (ctx, cartd, _) => Text(
                    cartd.totalAmount == 0
                        ? ' 0.0'
                        : cartd.totalAmount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Consumer<Cart>(
                  builder: (ctx, cartda, _) => Text(
                    '${cartda.cartlist.length} Products',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.teal,
          ),
          Expanded(
            child: Container(
                child: FutureBuilder(
              future:
                  Provider.of<Cart>(context, listen: false).fetchAndSetOrders(),
              builder: (ctx, datasnapshot) {
                if (datasnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (datasnapshot.error != null) {
                  print(datasnapshot.error);
                  return Center(
                    child: Text('an error occured'),
                  );
                } else {
                  print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                  return Consumer<Cart>(
                    builder: (ctx, cartdata, _) => cartdata.cartlist.length == 0
                        ? Center(
                            child: Text(
                              'Cart is empty',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  wordSpacing: 10,
                                  color: Colors.teal),
                            ),
                          )
                        : CartList(listy: cartdata.cartlist),
                  );
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
