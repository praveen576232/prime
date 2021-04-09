import 'package:amazon_prime/Widget/Movie/Related/tabs/More_details.dart';
import 'package:amazon_prime/Widget/Movie/Related/tabs/Related.dart';
import 'package:flutter/material.dart';

class RelatedMovie extends StatefulWidget {
  Uri movieuri;
  RelatedMovie(this.movieuri);
  @override
  _RelatedMovieState createState() => _RelatedMovieState();
}

class _RelatedMovieState extends State<RelatedMovie>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex =0;
    List<Widget> tabs ;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
 tabs = [Related(widget.movieuri), MoreDetails()];
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.14,
        width: size.width,
        child: Column(
          children: [
            Container(
                child: TabBar(
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                  Tab(text: "Related"),
                  Tab(
                    text: "More details",
                  )
                ],
                onTap: (index){
                  setState(() {
                    _currentIndex=index;
                  });
                },
                
                
                
                )),
                tabs[_currentIndex]
          ],
        ));
  }
}
