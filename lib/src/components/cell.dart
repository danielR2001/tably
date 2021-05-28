import 'package:flutter/material.dart';

class TablyCell {
  final Widget child;
  final bool placeholder;
  final bool showEditIcon;
  final VoidCallback? onTap;

  TablyCell({
    required this.child,
    this.placeholder = false,
    this.showEditIcon = false,
    this.onTap,
  });
}
