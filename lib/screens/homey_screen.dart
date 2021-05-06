import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forrira/providers/auth.dart';
import 'package:forrira/screens/auth_screen.dart';
import 'package:forrira/screens/cart_screen.dart';
import 'package:forrira/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import 'homey1.dart';
import 'homey2.dart';

class HomeyScreen extends StatefulWidget {
  static const routeName = '/homeyscreen';

  @override
  _HomeyScreenState createState() => _HomeyScreenState();
}

class _HomeyScreenState extends State<HomeyScreen> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': Homey1(), 'title': '  Home'},
      {'page': Homey2(), 'title': 'More '}
    ];

    // if (Provider.of<Auth>(context, listen: false).isAuth) {
    //   Provider.of<Auth>(context, listen: false).autoLogout(context);
    //   print('first time 777777777777777777777');
    // }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var bottom = BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 7,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 1 ? Colors.amber : Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: selectedIndex == 0 ? Colors.amber : Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
          //  title: Text('homey'),
          //  automaticallyImplyLeading: false,
          actions: selectedIndex == 0
              ? <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Container(
                      //  margin: const EdgeInsets.only(right: 75),
                      //width: 200,
                      child: Image.asset(
                        'assets/images/FORERA.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ]
              : [
                  IconButton(
                      icon: Icon(Icons.login),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AuthScreen.routeName);
                      })
                ]),
      drawer: AppDrawer(),
      body: _pages[selectedIndex]['page'],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.shopping_cart,
          size: 30,
          color: Colors.teal,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(CArt.routeName);
          print('999999999999999999999999999999999999999999999999999');
        },
      ),
      bottomNavigationBar: bottom,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
