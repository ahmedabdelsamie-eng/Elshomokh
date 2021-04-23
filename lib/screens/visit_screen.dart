import 'package:flutter/material.dart';

class VisitScreen extends StatelessWidget {
  static const routeName = '/visit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('visit screen'),
      ),
      body: Center(
        child: Text('hi'),
      ),
    );
  }
}
