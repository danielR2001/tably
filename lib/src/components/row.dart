import 'package:flutter/material.dart';
import 'package:tably/tably.dart';

class TablyRow {
  final List<TablyCell> cells;
  final bool selected;
  final Function(bool)? onSelect;
  final Color? color;

  const TablyRow({
    this.selected = false,
    this.onSelect,
    this.color,
    required this.cells,
  });
}
