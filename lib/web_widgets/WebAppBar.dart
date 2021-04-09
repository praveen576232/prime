import 'package:flutter/material.dart';

class WebAppBar extends StatefulWidget {
  Function(int) onClickTab;
  Size size;
  WebAppBar(this.size,this.onClickTab);

  @override
  _WebAppBarState createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size.width ,
      color: Colors.black87,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: widget.size.width * 0.4,
             
              child: Row(
                children: [
                  Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 60,
                  ),
                  Container(
                  width: widget.size.width * 0.3,
                    height: 60,
                    child: TabBar(
                      controller: tabcontroller,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.white,
                      labelPadding:  EdgeInsets.all(0.0),
                      indicatorPadding: EdgeInsets.all(0.0),
                      tabs: [
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "TV Show",
                        ),
                        Tab(
                          text: "Movies",
                        ),
                        Tab(
                          text: "Kids",
                        )
                      ],
                      onTap: (index) {
                        widget.onClickTab(index);
                      },
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right:60.0),
            child: Row(
                          children:[ 
                            Container(
              
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search,color: Colors.grey,),
                    TextField(
                  decoration: InputDecoration(hintText: "Search",hintStyle: TextStyle(
                    color: Colors.grey
                  )),
                ),
                  ],
                )
              ),
              SizedBox(
                width:40
              ),
               Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('images/stuff.png'),),
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
            ]
            ),
            
          ),
          
        ],
      ),
    );
  }
}
