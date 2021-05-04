import 'package:flutter/material.dart';
import 'package:forrira/providers/auth.dart';
import 'package:forrira/providers/cart.dart';
import 'package:forrira/providers/items.dart';
import 'package:forrira/screens/auth_screen.dart';
import 'package:forrira/screens/cart_screen.dart';
import 'package:forrira/screens/container1_screen.dart';
import 'package:forrira/screens/container2_screen.dart';
import 'package:forrira/screens/container3_screen.dart';
import 'package:forrira/screens/container4_screen.dart';
import 'package:forrira/screens/depcons_item_screen.dart';
import 'package:forrira/screens/dept_contents_screen.dart';
import 'package:forrira/screens/homey_screen.dart';
import 'package:forrira/screens/start.dart';
import 'package:forrira/screens/visit_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Cart>(
            update: (ctx, auth, previousProducts) => Cart(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.cartlist)

            // create: (ctx) => Cart(),
            ),
        ChangeNotifierProvider(
          create: (ctx) => Data(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => (MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.amber,
            backgroundColor: Colors.orange,
          ),
          home: Start()
          //auth.isAuth ? HomeyScreen() : Start()
          ,
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            VisitScreen.routeName: (ctx) => VisitScreen(),
            HomeyScreen.routeName: (ctx) => HomeyScreen(),
            DeptContentsScreen.routeName: (ctx) => DeptContentsScreen(),
            DeConsItemScreen.routeName: (ctx) => DeConsItemScreen(),
            CArt.routeName: (ctx) => CArt(),
            Container1Screen.routeName: (ctx) => Container1Screen(),
            Container2Screen.routeName: (ctx) => Container2Screen(),
            Container3Screen.routeName: (ctx) => Container3Screen(),
            Container4Screen.routeName: (ctx) => Container4Screen(),
          },
        )),
      ),
    );
  }
}
