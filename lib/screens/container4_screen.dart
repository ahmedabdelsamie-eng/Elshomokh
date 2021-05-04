import 'package:flutter/material.dart';

class Container4Screen extends StatefulWidget {
  static const routeName = '/contain4';
  @override
  _Container4ScreenState createState() => _Container4ScreenState();
}

class _Container4ScreenState extends State<Container4Screen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
