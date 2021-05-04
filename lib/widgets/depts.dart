import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forrira/models/dept.dart';

import 'dept_item.dart';

class DeptsChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: depts
          .map(
            (dept) => DeptItem(dept.id, dept.title, dept.color, dept.url),
          )
          .toList(),
    );
  }
}
