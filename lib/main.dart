import 'package:flutter/material.dart';
import 'package:forrira/providers/auth.dart';
import 'package:forrira/screens/auth_screen.dart';
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
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.green,
            backgroundColor: Colors.orange,
          ),
          home: Start()
          //auth.isAuth ? HomeyScreen() : Start()
          ,
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            VisitScreen.routeName: (ctx) => VisitScreen(),
            HomeyScreen.routeName: (ctx) => HomeyScreen(),
          },
        ),
      ),
    );
  }
}
