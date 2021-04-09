import 'dart:async';

import 'package:amazon_prime/carousel/circle/Circle.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  List<Widget> items = [];
  double height;
  double width;
  bool autoScroll;
  Duration autoScrollDuration;
  Duration animationPageDuration;
  Curve animationPageCurve;
  bool stopAtEnd;
  int initialPage = 0;
  Axis scrollAxis;
  double indicatorBarHeight;
  double indicatorBarWidth;
  double indicatorHeight;
  double indicatorWidth;
  bool isCircle;
  Color activateIndicatorColor;
  Color unActivatedIndicatorColor;
  Color indicatorBarColor;
  double indicatorBarColorOpacity;
  Carousel(
      {@required this.items,
      this.activateIndicatorColor = Colors.black,
      this.animationPageCurve = Curves.easeIn,
      this.animationPageDuration = Duration.zero,
      this.autoScroll = false,
      this.autoScrollDuration = Duration.zero,
      this.height = 0.0,
      this.indicatorBarHeight = 0.0,
      this.indicatorBarWidth = 0.0,
      this.indicatorHeight = 10,
      this.indicatorWidth = 10,
      this.initialPage = 0,
      this.isCircle = true,
      this.scrollAxis = Axis.horizontal,
      this.stopAtEnd = false,
      this.unActivatedIndicatorColor = Colors.grey,
      this.indicatorBarColor = Colors.black,
      this.width = 0.0});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _pageController;
  int _totleItem;
  int _current = 0;
  Timer mytimer;
  @override
  void initState() {
    _totleItem = widget.items.length;
    _pageController = PageController(initialPage: 0);
  
    super.initState();
     if (widget.autoScroll ) {
      Timer.periodic(
          widget.autoScrollDuration == Duration.zero
              ? Duration(seconds: 1)
              : widget.autoScrollDuration, (timer) {
        mytimer = timer;
      if(_pageController.hasClients){
          if (_current < _totleItem) {
          _pageController.animateToPage(_current++,


          
              duration: widget.animationPageDuration == Duration.zero
                  ? Duration(milliseconds: 500)
                  : widget.animationPageDuration,
              curve: widget.animationPageCurve);
        } else {
          if (widget.stopAtEnd) {
            timer.cancel();
          } else {
            _pageController.jumpToPage(0);
          }
        }
      }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (mytimer != null) mytimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     
    return Container(
      height: widget.height != 0.0 ? widget.height : size.height * 0.4,
      width: widget.width != 0.0 ? widget.width : size.width,
      child: Stack(
        children: [
          Container(
            height: widget.height != 0.0 ? widget.height : size.height * 0.4,
            width: widget.width != 0.0 ? widget.width : size.width,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: widget.scrollAxis,
              itemCount: _totleItem,
              itemBuilder: (context, index) {
                return Container(
                  height:
                      widget.height != 0.0 ? widget.height : size.height * 0.4,
                  width: widget.width != 0.0 ? widget.width : size.width,
                  child: widget.items[index],
                );
              },
              onPageChanged: (int i) {
                setState(() {
                  _current = i;
                });
              },
            ),
          ),
          Circle(
              activateIndicatorColor: widget.activateIndicatorColor,
              activeIndex: _current,
              count: _totleItem,
              height: widget.indicatorBarHeight == 0.0
                  ? 30
                  : widget.indicatorBarHeight,
              width: widget.indicatorBarWidth != 0.0
                  ? widget.indicatorBarWidth
                  : widget.width == 0.0
                      ? size.width
                      : widget.width,
              indicatorHeight: widget.indicatorHeight,
              indicatorWidth: widget.indicatorWidth,
              unActivatedIndicatorColor: widget.unActivatedIndicatorColor,
              isCircle: widget.isCircle,
              indicatorBarColor: widget.indicatorBarColor)
        ],
      ),
    );
  }
}
