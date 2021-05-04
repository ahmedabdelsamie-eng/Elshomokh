import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forrira/screens/container1_screen.dart';
import 'package:forrira/widgets/container.dart';
import 'package:forrira/widgets/panner.dart';

import 'container2_screen.dart';
import 'container3_screen.dart';
import 'container4_screen.dart';

class Homey2 extends StatelessWidget {
  // var index1 = 1;
  // var index2 = 2;
  // var index3 = 3;
  // var index4 = 4;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Panner(),
        InkWell(
          onTap: () {
            var text = 'Complisions and Sugessitions';
            Navigator.of(context)
                .pushNamed(Container1Screen.routeName, arguments: text);
          },
          child: Contain('Complisions and Sugessitions'),
        ),
        InkWell(
          child: Contain('Repeated Quesitions'),
          onTap: () {
            var text = 'Repeated Quesitions';
            Navigator.of(context)
                .pushNamed(Container2Screen.routeName, arguments: text);
          },
        ),
        InkWell(
          child: Contain('About The Application'),
          onTap: () {
            var text = 'About The Application';
            Navigator.of(context)
                .pushNamed(Container3Screen.routeName, arguments: text);
          },
        ),
        InkWell(
          child: Contain('Conditions and Judgements'),
          onTap: () {
            var text = 'Conditions and Judgements';
            Navigator.of(context)
                .pushNamed(Container4Screen.routeName, arguments: text);
          },
        ),
        SizedBox(
          height: 60,
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
                  onPressed: () {}),
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
        )
      ],
    );
  }
}
