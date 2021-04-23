import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  TabBarScreen({Key key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Container(
              height: 400,
              child: TabBarView(
                controller: tabController,
                children: [
                  PageOneScreen(
                    controller: tabController,
                    text: '1',
                  ),
                  PageOneScreen(
                    controller: tabController,
                    text: '2',
                  ),
                ],
              ),
            ),
            TabPageSelector(
              controller: tabController,
            ),
          ],
        ),
      ),
    );
  }
}

class PageOneScreen extends StatefulWidget {
  @override
  _PageOneScreenState createState() => _PageOneScreenState();

  final String text;
  PageOneScreen({controller, this.text}) {
    tabController = controller;
  }
}

TabController tabController;

class _PageOneScreenState extends State<PageOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () {
            tabController.animateTo(1); // number : index page
          },
          child: Text(
            widget.text,
          ),
        ),
      ],
    );
  }
}
