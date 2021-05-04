import 'package:flutter/material.dart';
import 'package:forrira/widgets/textincontainer.dart';

class Contain extends StatelessWidget {
  final String text;
  Contain(this.text);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 8),
        height: 50,
        child: Row(
          children: [
            Icon(
              Icons.article,
              color: Colors.teal,
            ),
            SizedBox(
              width: 3,
            ),
            SlideFadeTransition(
              curve: Curves.fastLinearToSlowEaseIn,
              delayStart: Duration(milliseconds: 300),
              animationDuration: Duration(milliseconds: 1000),
              offset: 2.5,
              direction: Direction.horizontal,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, wordSpacing: 8),
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_outlined,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
