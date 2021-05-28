import 'package:flutter/material.dart';
import 'package:tably/tably.dart';
import 'package:tably/src/utils/breakpoint_checker.dart';

class Tably extends StatefulWidget {
  final TablyHeader header;
  final TablyFooter footer;
  final DataTableSource source;

  final List<TablyAction>? actions;
  final TablySearchBar? searchBar;
  final TablyTheme? theme;
  final Function(bool value)? onSelectAll;

  final bool isLoading;

  const Tably(
    this.header,
    this.footer,
    this.source, {
    Key? key,
    this.actions,
    this.searchBar,
    this.theme,
    this.onSelectAll,
    this.isLoading: false,
  }) : super(key: key);

  @override
  _TablyState createState() => _TablyState();
}

class _TablyState extends State<Tably> {
  // Widget mobileHeader() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Checkbox(
  //           value: widget.selecteds.length == widget.source.length &&
  //               widget.source != null &&
  //               widget.source.length > 0,
  //           onChanged: (value) {
  //             if (widget.onSelectAll != null) widget.onSelectAll(value);
  //           }),
  //       PopupMenuButton(
  //           child: Container(
  //             padding: EdgeInsets.all(15),
  //             child: Text("SORT BY"),
  //           ),
  //           tooltip: "SORT BY",
  //           initialValue: widget.sortColumn,
  //           itemBuilder: (_) => widget.headers
  //               .where(
  //                   (header) => header.show == true && header.sortable == true)
  //               .toList()
  //               .map((header) => PopupMenuItem(
  //                     child: Wrap(
  //                       crossAxisAlignment: WrapCrossAlignment.center,
  //                       children: [
  //                         Text(
  //                           "${header.text}",
  //                           textAlign: header.textAlign,
  //                         ),
  //                         if (widget.sortColumn != null &&
  //                             widget.sortColumn == header.value)
  //                           widget.sortAscending
  //                               ? Icon(Icons.arrow_downward, size: 15)
  //                               : Icon(Icons.arrow_upward, size: 15)
  //                       ],
  //                     ),
  //                     value: header.value,
  //                   ))
  //               .toList(),
  //           onSelected: (value) {
  //             if (widget.onSort != null) widget.onSort(value);
  //           })
  //     ],
  //   );
  // }

  // List<Widget> mobileList() {
  //   return widget.source.map((data) {
  //     return InkWell(
  //       onTap: widget.onTabRow != null
  //           ? () {
  //               widget.onTabRow(data);
  //             }
  //           : null,
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border: Border(
  //                 bottom: BorderSide(color: Colors.grey[300], width: 1))),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Spacer(),
  //                 if (widget.showSelect && widget.selecteds != null)
  //                   Checkbox(
  //                       value: widget.selecteds.indexOf(data) >= 0,
  //                       onChanged: (value) {
  //                         if (widget.onSelect != null)
  //                           widget.onSelect(value, data);
  //                       }),
  //               ],
  //             ),
  //             ...widget.headers
  //                 .where((header) => header.show == true)
  //                 .toList()
  //                 .map(
  //                   (header) => Container(
  //                     padding: EdgeInsets.all(11),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         header.headerBuilder != null
  //                             ? header.headerBuilder(header.value)
  //                             : Text(
  //                                 "${header.text}",
  //                                 overflow: TextOverflow.clip,
  //                               ),
  //                         Spacer(),
  //                         header.sourceBuilder != null
  //                             ? header.sourceBuilder(data[header.value], data)
  //                             : header.editable
  //                                 ? editableWidget(
  //                                     data: data,
  //                                     header: header,
  //                                     textAlign: TextAlign.end,
  //                                   )
  //                                 : Text("${data[header.value]}")
  //                       ],
  //                     ),
  //                   ),
  //                 )
  //                 .toList()
  //           ],
  //         ),
  //       ),
  //     );
  //   }).toList();
  // }

  // Alignment headerAlignSwitch(TextAlign textAlign) {
  //   switch (textAlign) {
  //     case TextAlign.center:
  //       return Alignment.center;
  //       break;
  //     case TextAlign.left:
  //       return Alignment.centerLeft;
  //       break;
  //     case TextAlign.right:
  //       return Alignment.centerRight;
  //       break;
  //     default:
  //       return Alignment.center;
  //   }
  // }

  // Widget desktopHeader() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         border:
  //             Border(bottom: BorderSide(color: Colors.grey[300], width: 1))),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         if (widget.showSelect && widget.selecteds != null)
  //           Checkbox(
  //               value: widget.selecteds.length == widget.source.length &&
  //                   widget.source != null &&
  //                   widget.source.length > 0,
  //               onChanged: (value) {
  //                 if (widget.onSelectAll != null) widget.onSelectAll(value);
  //               }),
  //         ...widget.headers
  //             .where((header) => header.show == true)
  //             .map(
  //               (header) => Expanded(
  //                   flex: header.flex ?? 1,
  //                   child: InkWell(
  //                     onTap: () {
  //                       if (widget.onSort != null && header.sortable)
  //                         widget.onSort(header.value);
  //                     },
  //                     child: header.headerBuilder != null
  //                         ? header.headerBuilder(header.value)
  //                         : Container(
  //                             padding: EdgeInsets.all(11),
  //                             alignment: headerAlignSwitch(header.textAlign),
  //                             child: Wrap(
  //                               crossAxisAlignment: WrapCrossAlignment.center,
  //                               children: [
  //                                 Text(
  //                                   "${header.text}",
  //                                   textAlign: header.textAlign,
  //                                 ),
  //                                 if (widget.sortColumn != null &&
  //                                     widget.sortColumn == header.value)
  //                                   widget.sortAscending
  //                                       ? Icon(Icons.arrow_downward, size: 15)
  //                                       : Icon(Icons.arrow_upward, size: 15)
  //                               ],
  //                             ),
  //                           ),
  //                   )),
  //             )
  //             .toList()
  //       ],
  //     ),
  //   );
  // }

  // List<Widget> desktopList() {
  //   List<Widget> widgets = [];
  //   for (var index = 0; index < widget.source.length; index++) {
  //     final data = widget.source[index];
  //     widgets.add(Column(
  //       children: [
  //         InkWell(
  //           onTap: () {
  //             widget.onTabRow != null ? widget.onTabRow(data) : null;
  //             setState(() {
  //               widget.expanded[index] = !widget.expanded[index];
  //             });
  //           },
  //           child: Container(
  //             padding: EdgeInsets.all(widget.showSelect ? 0 : 11),
  //             decoration: BoxDecoration(
  //                 border: Border(
  //                     bottom: BorderSide(color: Colors.grey[300], width: 1))),
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 if (widget.showSelect && widget.selecteds != null)
  //                   Row(
  //                     children: [
  //                       Checkbox(
  //                           value: widget.selecteds.indexOf(data) >= 0,
  //                           onChanged: (value) {
  //                             if (widget.onSelect != null)
  //                               widget.onSelect(value, data);
  //                           }),
  //                       // RaisedButton(onPressed: (){
  //                       //   setState(() {
  //                       //     widget.expanded[widget.selecteds.indexOf(data)] = true;
  //                       //   });
  //                       // },
  //                       // child: Text("Drop"),)
  //                     ],
  //                   ),
  //                 ...widget.headers
  //                     .where((header) => header.show == true)
  //                     .map(
  //                       (header) => Expanded(
  //                         flex: header.flex ?? 1,
  //                         child: header.sourceBuilder != null
  //                             ? header.sourceBuilder(data[header.value], data)
  //                             : header.editable
  //                                 ? editableWidget(
  //                                     data: data,
  //                                     header: header,
  //                                     textAlign: header.textAlign,
  //                                   )
  //                                 : Container(
  //                                     child: Text(
  //                                       "${data[header.value]}",
  //                                       textAlign: header.textAlign,
  //                                     ),
  //                                   ),
  //                       ),
  //                     )
  //                     .toList()
  //               ],
  //             ),
  //           ),
  //         ),
  //         widget.expanded[index] ? widget.dropContainer(data) : Container()
  //       ],
  //     ));
  //   }
  //   return widgets;
  // }

  Widget mobileBody() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  Widget tabletBody() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  Widget desktopBody() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = getMode(context);
    return Column(
      children: [
        widget.isLoading ? LinearProgressIndicator() : SizedBox.shrink(),
        widget.header,
        breakPoint == BreakPoint.DESKTOP
            ? desktopBody()
            : breakPoint == BreakPoint.TABLET
                ? tabletBody()
                : mobileBody(),
        widget.footer,
      ],
    );

    //   return context.isExtraSmall || context.isSmall || context.isMedium
    //       ?
    //       /**
    //        * for small screen
    //        */
    //       Container(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               //title and actions
    //               if (widget.title != null || widget.actions != null)
    //                 Container(
    //                   padding: EdgeInsets.all(5),
    //                   decoration: BoxDecoration(
    //                       border: Border(
    //                           bottom: BorderSide(color: Colors.grey[300]))),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       if (widget.title != null) widget.title,
    //                       if (widget.actions != null) ...widget.actions
    //                     ],
    //                   ),
    //                 ),

    //               if (widget.autoHeight)
    //                 Column(
    //                   children: [
    //                     if (widget.showSelect && widget.selecteds != null)
    //                       mobileHeader(),
    //                     if (widget.isLoading) LinearProgressIndicator(),
    //                     //mobileList
    //                     ...mobileList(),
    //                   ],
    //                 ),
    //               if (!widget.autoHeight)
    //                 Expanded(
    //                   child: Container(
    //                     child: ListView(
    //                       // itemCount: source.length,
    //                       children: [
    //                         if (widget.showSelect && widget.selecteds != null)
    //                           mobileHeader(),
    //                         if (widget.isLoading) LinearProgressIndicator(),
    //                         //mobileList
    //                         ...mobileList(),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               //footer
    //               if (widget.footers != null)
    //                 Container(
    //                   child: Wrap(
    //                     crossAxisAlignment: WrapCrossAlignment.center,
    //                     children: [...widget.footers],
    //                   ),
    //                 )
    //             ],
    //           ),
    //         )
    //       /**
    //         * for large screen
    //         */
    //       : Container(
    //           child: Column(
    //             children: [
    //               //title and actions
    //               if (widget.title != null || widget.actions != null)
    //                 Container(
    //                   padding: EdgeInsets.all(5),
    //                   decoration: BoxDecoration(
    //                     border: Border(
    //                       bottom: BorderSide(
    //                         color: Colors.grey[300],
    //                       ),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       if (widget.title != null) widget.title,
    //                       if (widget.actions != null) ...widget.actions
    //                     ],
    //                   ),
    //                 ),

    //               //desktopHeader
    //               if (widget.headers != null && widget.headers.isNotEmpty)
    //                 desktopHeader(),

    //               if (widget.isLoading) LinearProgressIndicator(),

    //               if (widget.autoHeight) Column(children: desktopList()),

    //               if (!widget.autoHeight)
    //                 // desktopList
    //                 if (widget.source != null && widget.source.isNotEmpty)
    //                   Expanded(
    //                     child: Container(
    //                       child: Scrollbar(
    //                         child: ListView(
    //                           children: desktopList(),
    //                         ),
    //                       ),
    //                     ),
    //                   ),

    //               //footer
    //               if (widget.footers != null)
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [...widget.footers],
    //                 )
    //             ],
    //           ),
    //         );
  }
}
