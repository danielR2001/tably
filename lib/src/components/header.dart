import 'package:flutter/material.dart';
import 'package:tably/tably.dart';

class TablyHeader extends StatelessWidget {
  final List<TablyColumn> columns;
  final double height;
  final BoxDecoration decoration;

  TablyHeader({
    required this.columns,
    this.height = 60,
    this.decoration = const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Row(
        children: columns,
      ),
    );
  }
}
