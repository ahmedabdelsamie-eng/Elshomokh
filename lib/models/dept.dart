import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dept {
  final String id;
  final String title;
  final String url;
  final Color color;
  const Dept(
      {@required this.id,
      @required this.title,
      this.color = Colors.orange,
      @required this.url});
}

const depts = const [
  const Dept(
      id: 'fruit',
      title: 'Fruits',
      color: Colors.white,
      url: 'assets/images/fruit.jpeg'),
  const Dept(
      id: 'vega',
      title: 'Vegetables',
      color: Colors.white,
      url: 'assets/images/vega.jpeg'),
  const Dept(
      id: 'leav',
      title: 'Leaves',
      color: Colors.white54,
      url: 'assets/images/leva.jpeg'),
];
