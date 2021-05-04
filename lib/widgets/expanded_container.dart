import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forrira/widgets/textincontainer.dart';

class ExpandedContainer extends StatefulWidget {
  final String text1;
  final String text2;
  ExpandedContainer(this.text1, this.text2);
  static const routeName = '/contain';
  @override
  _ExpandedContainer createState() => _ExpandedContainer();
}

class _ExpandedContainer extends State<ExpandedContainer> {
  var expand = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        width: double.infinity,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
        height: expand ? min(100, 120) : 50,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[200]),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Text(
                    widget.text1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      icon: expand
                          ? Icon(Icons.keyboard_arrow_up_rounded)
                          : Icon(Icons.keyboard_arrow_down_outlined),
                      onPressed: () {
                        setState(() {
                          expand = !expand;
                        });
                      })
                ],
              ),
            ),
            AnimatedContainer(
                padding: EdgeInsets.only(top: 5),
                height: expand ? min(25, 35) : 0,
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
                child: SlideFadeTransition(
                  delayStart: Duration(milliseconds: 300),
                  animationDuration: Duration(milliseconds: 500),
                  child: Text(
                    widget.text2,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
