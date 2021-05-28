import 'package:flutter/material.dart';

enum BreakPoint {
  MOBILE,
  TABLET,
  DESKTOP,
}

BreakPoint getMode(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width < 600
      ? BreakPoint.MOBILE
      : width < 1200
          ? BreakPoint.TABLET
          : BreakPoint.DESKTOP;
}
