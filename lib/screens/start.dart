import 'package:flutter/material.dart';
import 'package:forrira/screens/auth_screen.dart';
import 'package:forrira/screens/homey_screen.dart';

class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);

  @override
  _Start createState() => _Start();
}

class _Start extends State<Start> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: TabBarView(
          controller: tabController,
          children: [
            PageOneScreen(
              controller: tabController,
              url:
                  'https://previews.123rf.com/images/robikucluk/robikucluk2005/robikucluk200500014/147651306-vector-illustration-for-delivery-service-man-give-a-box-to-customer-its-perfect-for-logistic-busines.jpg',
              text: 'perfect service',
              nm: 1,
            ),
            PageOneScreen(
              controller: tabController,
              url:
                  'https://im.whatshot.in/img/2020/Apr/graboxcropped-1586418757-1587568805-1588243758.jpg',
              text: 'delivery service',
              nm: 2,
            ),
            PageOneScreen(
              controller: tabController,
              url:
                  'https://pomokata.com/wp-content/uploads/2019/07/pomodoro-delivery-logo.png',
              text: 'high quality products',
              nm: 3,
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

  final String url;
  final String text;
  final int nm;
  PageOneScreen({controller, this.url, this.text, this.nm}) {
    tabController = controller;
  }
}

TabController tabController;

class _PageOneScreenState extends State<PageOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          alignment: Alignment.centerRight,
          // ignore: deprecated_member_use
          child: FlatButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.language,
              size: 30,
            ),
            label: Text(
              'language',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  child: Image.network(widget.url),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
                TabPageSelector(
                  color: Colors.white,
                  selectedColor: Colors.green,
                  indicatorSize: 15,
                  controller: tabController,
                ),
              ],
            ),
          ),
        ), ////////////////////////first
        if (widget.nm == 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  tabController.animateTo(2);
                },
                child: Text(
                  'skip',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  print('hi' + tabController.index.toString());
                  if (tabController.index > 1) {
                    return;
                  }
                  tabController.animateTo(tabController.index + 1);
                },
                child: Text(
                  'next',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ), ///////////////second
        if (widget.nm == 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  tabController.animateTo(0);
                },
                child: Text(
                  'pervios',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  print('hi' + tabController.index.toString());
                  if (tabController.index > 1) {
                    return;
                  }
                  tabController.animateTo(tabController.index + 1);
                },
                child: Text(
                  'next',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        if (widget.nm == 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeyScreen.routeName);
                },
                child: Text(
                  'vist first',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
                },
                child: Text(
                  'login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
