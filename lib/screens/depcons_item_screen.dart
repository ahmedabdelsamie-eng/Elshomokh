import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:forrira/models/item.dart';
import 'package:forrira/providers/cart.dart';
import 'package:forrira/providers/items.dart';
import 'package:forrira/widgets/calc.dart';
import 'package:forrira/widgets/gridforitemscreen.dart';
import 'package:provider/provider.dart';

class DeConsItemScreen extends StatefulWidget {
  static const routeName = '/item-screen';

  @override
  _DeConsItemScreenState createState() => _DeConsItemScreenState();
}

class _DeConsItemScreenState extends State<DeConsItemScreen> {
  final String unique = 'this is DeConsItemScreen';
  var countNum1 = 0;

  var countNum2 = 0;

  var countNum3 = 0;

  void countNum(int cNum1, cNum2, cNum3) {
    if (cNum1 >= 0) {
      setState(() {
        countNum1 = cNum1;
      });
    }
    if (cNum2 >= 0) {
      setState(() {
        countNum2 = cNum2;
      });
    }
    if (cNum3 >= 0) {
      setState(() {
        countNum3 = cNum3;
      });
    }
  }

  String itemTitle;
  String itemId;
  String itemPrice;
  String itemImage;
  String itemDept;
  Map<String, String> itemCan;
  List<Item> toShow2;
  var init = true;
  @override
  void didChangeDependencies() {
    if (init) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      itemId = routeArgs['id'];
      itemTitle = routeArgs['title'];
      itemPrice = routeArgs['price'];
      itemImage = routeArgs['image'];
      itemDept = routeArgs['dept'];
      itemCan = routeArgs['can'];
      print('000000000test00000000');
      print(itemCan);

      List<Item> ss = Data().items;
      toShow2 = ss.where((element) => element.dept == itemDept).toList();
    }
    init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              color: Colors.teal,
              // child:
              child: Hero(
                tag: itemId,
                child: Image.asset(
                  itemImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 260,
              //color: Colors.teal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.teal),
                      child: AnimatedTextKit(
                        animatedTexts: [WavyAnimatedText(itemTitle + ' :')],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20, top: 0),
                    width: double.infinity,
                    child: Text(
                      'is testy , fresh and makes you feel happy',
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          //fontSize: 20,
                          color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Status /',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'available',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  /////////////
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      //height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '  ' + itemCan['kilo'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '  ' + itemCan['bx3'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '  ' + itemCan['bx5'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '1' + ' Kilo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Box ' + '3 Kilo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Box ' + '5 Kilo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          BuyCalc(countNum),
                        ],
                      ),
                    ),
                  ),
                  /////////
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 8),
                    child: Text(
                      'Related Products :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            GridForItemScreen(
              itemDept,
              scroll: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationView(itemId, itemTitle, itemPrice,
          itemDept, itemImage, countNum1, countNum2, countNum3, itemCan),
    );
  }
}

class BottomNavigationView extends StatefulWidget {
  final String gettedItemId;
  final String gettedItemPrice;
  final String gettedItemTitle;
  final String gettedItemDept;
  final String gettedItemImage;
  final int gettedcount1;
  final int gettedcount2;
  final int gettedcount3;
  final Map<String, String> gettedcan;
  BottomNavigationView(
      this.gettedItemId,
      this.gettedItemTitle,
      this.gettedItemPrice,
      this.gettedItemDept,
      this.gettedItemImage,
      this.gettedcount1,
      this.gettedcount2,
      this.gettedcount3,
      this.gettedcan);

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  String canpart;

  String priceofcanpart;

  int quantity;

  int changeTotal(int a, int b, int c) {
    if (a != 0) {
      canpart = 'kilo';
      quantity = a;
      priceofcanpart = widget.gettedcan['kilo'];
      return (a * int.parse(widget.gettedItemPrice));
    } else if (b != 0) {
      canpart = 'bx3';
      quantity = b;
      priceofcanpart = widget.gettedcan['bx3'];
      return (b * 3 * int.parse(widget.gettedItemPrice));
    } else if (c != 0) {
      canpart = 'bx5';
      quantity = c;
      priceofcanpart = widget.gettedcan['bx5'];
      return (c * 5 * int.parse(widget.gettedItemPrice));
    } else {
      return 0;
    }
  }

  var init = true;
  var cartData;
  @override
  void didChangeDependencies() {
    if (init) {
      cartData = Provider.of<Cart>(
        context,
      );
      cartData.fetchAndSetOrders();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black38,
      height: 55,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.teal,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${changeTotal(widget.gettedcount1, widget.gettedcount2, widget.gettedcount3)} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.amber),
                  ),
                ],
              ),
              FlatButton.icon(
                onPressed: widget.gettedcount1 == 0 &&
                        widget.gettedcount2 == 0 &&
                        widget.gettedcount3 == 0
                    ? null
                    : () async {
                        var result = cartData.cartlist.any((element) =>
                            element.dadId == widget.gettedItemId &&
                            element.boughtCan.containsKey(canpart));
                        if (result) {
                          Scaffold.of(context).hideCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black38,
                              content: Text(
                                'This  Item  is  Exist !',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        await cartData.addCart(
                            widget.gettedItemId,
                            widget.gettedItemTitle,
                            widget.gettedItemDept,
                            widget.gettedItemPrice,
                            widget.gettedItemImage,
                            canpart,
                            priceofcanpart,
                            quantity);
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black38,
                            content: Text(
                              'Added Item To CArt',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.amber,
                  size: 30,
                ),
                label: FittedBox(
                  child: Text(
                    'ADD To Cart',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                hoverColor: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
////////////////
// import 'package:flutter/material.dart';

// class DeConsItemScreen extends StatelessWidget {
//   static const routeName = '/item-screen';
//   @override
//   Widget build(BuildContext context) {
//     String itemTitle;
//     String itemId;
//     String itemPrice;
//     String itemImage;

//     final routeArgs =
//         ModalRoute.of(context).settings.arguments as Map<String, String>;
//     itemId = routeArgs['id'];
//     itemTitle = routeArgs['title'];
//     itemPrice = routeArgs['price'];
//     itemImage = routeArgs['image'];

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(loadedProduct.title),
//       // ),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 300,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(itemTitle),
//               background: Hero(
//                 tag: itemId,
//                 child: Image.asset(
//                   itemImage,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   itemPrice,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     'syfdsgfdhfghkgflkdjzhb',
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 800,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
