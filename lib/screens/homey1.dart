import 'package:flutter/material.dart';
import 'package:forrira/widgets/depts.dart';
import 'package:forrira/widgets/panner.dart';

import '../carousel.dart';

class Homey1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Panner(),
        Container(
          decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.pink,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: CarouselDemo(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Text(
            'Departements :',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.teal),
          ),
        ),
        Container(
          width: double.infinity,
          child: DeptsChip(),
        ),
      ],
    );
  }
}
