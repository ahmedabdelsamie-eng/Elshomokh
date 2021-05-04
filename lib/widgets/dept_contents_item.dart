import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forrira/screens/depcons_item_screen.dart';

class DeptContentsItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String price;
  final String dept;
  final Map<String, String> can;
  DeptContentsItem(
      this.id, this.title, this.image, this.price, this.dept, this.can);

  void goToItemScreen(BuildContext ctx) {
    //  if(unique!=null){}else{}
    Navigator.of(ctx).pushNamed(DeConsItemScreen.routeName, arguments: {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'dept': dept,
      'can': can
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToItemScreen(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 15,
        shadowColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(5),

          // ignore: deprecated_member_use
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  // width: double.infinity,
                  child:
                      //  Hero(
                      //   tag: id,

                      //   child:
                      Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                //),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                        // ignore: deprecated_member_use
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    FittedBox(
                      child: Text(
                        'Available',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                        // ignore: deprecated_member_use
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: Text(
                        'KILO', style: TextStyle(fontWeight: FontWeight.bold),
                        // ignore: deprecated_member_use
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        price, style: TextStyle(fontWeight: FontWeight.bold),
                        // ignore: deprecated_member_use
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
