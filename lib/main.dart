import 'package:amazon_prime/tabs/Home.dart';
import 'package:amazon_prime/urls/urls.dart';
import 'package:amazon_prime/custom_ions_icons.dart';
import 'package:amazon_prime/web_widgets/WebAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Video',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  int currentIndex = 0;
  bool priviousState = false;
  bool _currentState = false;

  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
  }

  List<Widget> alltabs() {
    List<Widget> list = [
      Home((state) {
        if (priviousState != state) {
          setState(() {
            priviousState = state;
          });
        }
      }),
      Home((state) {}),
      Home((state) {}),
      Home((state) {})
    ];
    return list;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 150),
        child: kIsWeb
            ? Container(
                height: 50,
                width: size.width,
                child: WebAppBar(size, (index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
              )
            : AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: priviousState ? 78.0 : 120.0,
                child: AppBar(
                  backgroundColor: Colors.black,
                  title: Visibility(
                    visible: !priviousState,
                    child: Image.asset(
                      "images/logo.png",
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  centerTitle: true,
                  bottom: TabBar(
                    controller: tabcontroller,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.white,
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
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
      ),
      body: TabBarView(
        children: alltabs(),
        controller: tabcontroller,
      ),
      bottomNavigationBar: kIsWeb
          ? Offstage()
          : BottomNavigationBar(
              selectedFontSize: 9.0,
              unselectedFontSize: 9.0,
              showUnselectedLabels: true,
              currentIndex: 1,
              items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                       Icons.home_outlined,
                       size: 22.0,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.blue),
                      ),
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                         size: 24.0,
                      ),
                      title: Text(
                        "Find",
                        style: TextStyle(color: Colors.grey),
                      ),
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CustomIons.download,
                        color: Colors.grey,
                         size: 24.0,
                      ),
                      title: Text(
                        "Downloads",
                        style: TextStyle(color: Colors.grey),
                      )),
                  BottomNavigationBarItem(
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('images/stuff.png'),),
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
                      title: Text(
                        "My Stuff",
                        style: TextStyle(color: Colors.grey),
                      )),
                ]),
    );
  }
}
