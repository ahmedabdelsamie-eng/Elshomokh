import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;

  final String price;
  final String image;
  final String dept;
  final Map<String, String> can;
  const Item(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.image,
      @required this.dept,
      @required this.can});
}
