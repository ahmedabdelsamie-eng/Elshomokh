import 'package:flutter/material.dart';
import 'package:forrira/providers/cart.dart';
import 'package:forrira/widgets/calc_part.dart';
import 'package:provider/provider.dart';

class CArtScreenItem extends StatelessWidget {
  final String id;
  final String title;
  final String price;
  final Map<String, Map<String, Object>> boughtCan;
  final String dept;
  final String image;

  CArtScreenItem({
    this.id,
    this.title,
    this.price,
    this.boughtCan,
    this.dept,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    // print(boughtCan.keys.toList()[0]);

    final cartAccess = Provider.of<Cart>(context, listen: false);
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(4),
        // margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
        //height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(image),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 9),
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            dept,
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FlatButton.icon(
                    onPressed: () {
                      cartAccess.removeFromCart(id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.orange,
                    ),
                    label: Text('Delete')),
              ],
            ),
            Spacer(),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: ' + boughtCan.values.toList()[0]['price'] + ' \$',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(boughtCan.keys.toList()[0] == 'kilo'
                    ? ' Kilo'
                    : boughtCan.keys.toList()[0] == 'bx3'
                        ? 'box 3'
                        : ' box 5'),
                SizedBox(
                  height: 5,
                ),
                CalcPart(boughtCan.values.toList()[0]['quantity']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
