import 'package:flutter/material.dart';

class Panner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              //  width: double.infinity,

              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Delivery duration ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '3 Hour 40 Minutes',
                    style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              //  width: double.infinity,

              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Delivery hours  ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'From 8 To 10',
                    style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
