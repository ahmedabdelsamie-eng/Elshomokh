import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forrira/providers/items.dart';
import 'package:forrira/widgets/expanded_container.dart';

class Container2Screen extends StatefulWidget {
  static const routeName = '/contain2';
  @override
  _Container2ScreenState createState() => _Container2ScreenState();
}

class _Container2ScreenState extends State<Container2Screen> {
  var init = true;
  var routeArgs;
  // var expand = false;

  @override
  void didChangeDependencies() {
    if (init) {
      routeArgs = ModalRoute.of(context).settings.arguments as String;
    }
    init = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              print('hereeeeeeeeeeeeeeeeeeeeee');
              await Data().fetchProducts();
              print('doneeeeeeeeeeeeeeeeeeeeeeeeee');
            },
            child: Text('press'),
          ),
          ExpandedContainer('is Products available all times ?', 'YES'),
          ExpandedContainer('Which times does delivery is available ?',
              'from 10:0 PM : 8:0 AM'),
          ExpandedContainer(
              'Two Adresses to delivery is availbale ?', 'yes it is ok'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.brown,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                    onPressed: () {})
              ],
            ),
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
