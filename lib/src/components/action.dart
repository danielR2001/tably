import 'package:flutter/material.dart';

enum ActionLocation {
  Header,
  Footer,
}

class TablyAction {
  final Icon icon;
  final Function onActionClick;
  final ActionLocation actionLocation;

  TablyAction({
    required this.icon,
    required this.onActionClick,
    this.actionLocation = ActionLocation.Header,
  });
}
