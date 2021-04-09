import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  double width;
  double height;
  int activeIndex;
  int count;
  double indicatorHeight;
  double indicatorWidth;
  bool isCircle;
  Color activateIndicatorColor;
  Color unActivatedIndicatorColor;
  Color indicatorBarColor;
  Circle(
      {@required this.width,
      @required this.height,
      @required this.activeIndex,
      @required this.count,
      @required this.activateIndicatorColor,
      @required this.indicatorHeight,
      @required this.indicatorWidth,
      @required this.indicatorBarColor,
      this.isCircle,
      @required this.unActivatedIndicatorColor});

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  List<Widget> widgets = [];
  Widget mywidget(index) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        width: widget.indicatorWidth,
        height: widget.indicatorHeight,
        decoration: BoxDecoration(
            color: index == widget.activeIndex
                ? widget.activateIndicatorColor
                : widget.unActivatedIndicatorColor,
            shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widgets.clear();
    for (var i = 0; i < widget?.count; i++) {
      widgets.add(mywidget(i));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: widget.height,
        width: widget.width,
        color:widget.indicatorBarColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgets?.length > 0 ? widgets : []),
      ),
    );
  }
}
