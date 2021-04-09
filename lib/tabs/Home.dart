import 'package:amazon_prime/Widget/MovieListWidget.dart';
import 'package:amazon_prime/carousel/carousel.dart';
import 'package:amazon_prime/urls/urls.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

// base url https://api.themoviedb.org/3
class Home extends StatefulWidget {
  Function(bool) hidelogo;
  Home(this.hidelogo);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> movieImages = [];

  List<Widget> widgets = [];
  ScrollController _scrollController = ScrollController();
  Widget mywidget(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  void initState() {
    getMovieList(Allurls.kannadamovie);
    getMovieList(Allurls.telugumovie);
    getMovieList(Allurls.fetchTrending);
  }

  getMovieList(Uri url) async {
    var result = await http.get(url);
    Map moviedata = jsonDecode(result.body);
    if (moviedata != null && moviedata['results'].length > 2) {
      setState(() {
        movieImages.add("https://image.tmdb.org/t/p/original" +
            moviedata['results'][0]['backdrop_path']);
        movieImages.add("https://image.tmdb.org/t/p/original" +
            moviedata['results'][1]['backdrop_path']);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Future<List<Widget>> getImageSliderWidgets() {
    if (movieImages != null && movieImages.length > 0) {
      List<Widget> movieImagesWidgets = [];
      movieImages.forEach((element) {
        
        movieImagesWidgets.add(Container(
          child: Image.network(    element,
       
            fit: BoxFit.cover,
          ),
        ));
      });
      return Future.value(movieImagesWidgets);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_scrollController != null) {
      _scrollController.addListener(() {
        if (_scrollController.offset > 100) {
          widget.hidelogo(true);
        } else {
          widget.hidelogo(false);
        }
      });
    }

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black,
      child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
              child: ListView(
          controller: _scrollController,
          children: [
            Container(
                height: kIsWeb ? size.height * 0.4 : size.height * 0.2,
                width: size.width,
                child: FutureBuilder(
                    future: getImageSliderWidgets(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                       
                        return Carousel(
                          autoScroll: true,
                          items: snapshot.data,
                          indicatorBarColor: Colors.black.withOpacity(0.1),
                          unActivatedIndicatorColor: Colors.grey,
                          activateIndicatorColor: Colors.white,
                        );
                      } else {
                        
                        return Carousel(items: [
                          Container(
                              child: Image.asset('images/prime_background.PNG')),
                          Container(
                              child: Image.asset('images/prime_background.PNG')),
                        ]);
                      }
                    })),
            MovieListWidget("Trending movies", Allurls.fetchTrending),
            MovieListWidget("Kannada movies", Allurls.kannadamovie),
            MovieListWidget("Telugu movies", Allurls.telugumovie),
            MovieListWidget("Malayalam movies", Allurls.malayalammovie),
            MovieListWidget("Comedy movies", Allurls.feachComedyMovies),
            MovieListWidget("Horor movies", Allurls.feachHororMovie),
            MovieListWidget("Scifi", Allurls.feachScifi),
          ],
        ),
      ),
    );
  }
}
