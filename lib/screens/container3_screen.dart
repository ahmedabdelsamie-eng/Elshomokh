import 'package:flutter/material.dart';

class Container3Screen extends StatefulWidget {
  static const routeName = '/contain3';
  @override
  _Container3ScreenState createState() => _Container3ScreenState();
}

class _Container3ScreenState extends State<Container3Screen> {
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
