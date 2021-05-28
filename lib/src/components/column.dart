import 'package:flutter/material.dart';

class TablyColumn extends StatelessWidget {
  final Widget label;
  final String? tooltip;
  final Icon sortIcon;
  final bool sortable;

  TablyColumn({
    required this.label,
    this.tooltip,
    this.sortIcon = const Icon(Icons.arrow_downward_rounded),
    this.sortable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        label,
        sortable ? sortIcon : SizedBox.shrink(),
      ],
    );
  }
}
