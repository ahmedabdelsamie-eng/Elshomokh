import 'package:flutter/material.dart';

class VisitScreen extends StatefulWidget {
  static const routeName = '/visit';

  @override
  _VisitScreenState createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.close),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 5,
        child: Row(children: [
          Icon(Icons.cancel),
          Icon(Icons.cancel),
          Icon(Icons.cancel),
          Icon(Icons.cancel),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
