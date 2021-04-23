import 'package:flutter/material.dart';
import 'package:forrira/widgets/app_drawer.dart';

class HomeyScreen extends StatelessWidget {
  static const routeName = '/homeyscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homey'),
        //  automaticallyImplyLeading: false,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('welcome'),
      ),
    );
  }
}
