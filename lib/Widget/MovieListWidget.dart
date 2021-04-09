
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'Movie/Movie.dart';
import 'package:http/http.dart' as http;

class MovieListWidget extends StatelessWidget {
  String title;
  Uri movieUri;
  MovieListWidget(this.title, @required this.movieUri);
  final _imageBaseUrl = "https://image.tmdb.org/t/p/original/";
  Map moviedata;
  getMovieList(Uri url) async {
    var result = await http.get(url);
   
    moviedata = jsonDecode(result.body);
    return moviedata;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          height: kIsWeb ? 240 : size.height * 0.14,
          width: size.width,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
            child: FutureBuilder(
              future: getMovieList(movieUri),
              builder: (content, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data['results'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: kIsWeb
                              ? const EdgeInsets.all(15.0)
                              : const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                                height: kIsWeb ? 240 : size.height * 0.15,
                                width: kIsWeb ? 310 : size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: FadeInImage(
                                    image:snapshot.data['results'][index]
                                            ['backdrop_path']!=null ? NetworkImage(_imageBaseUrl +
                                        snapshot.data['results'][index]['backdrop_path']): AssetImage(
                                        'images/prime_background.PNG'),
                                            
                                    placeholder: AssetImage(
                                        'images/prime_background.PNG'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Movie(
                                          snapshot.data['results'][index],
                                          movieUri)));
                            },
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: kIsWeb
                              ? const EdgeInsets.all(15.0)
                              : const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                                height: kIsWeb ? 240 : size.height * 0.15,
                                width: kIsWeb ? 310 : size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Image.asset(
                                    'images/prime_background.PNG',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            onTap: () {
                              if(moviedata !=null){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Movie(
                                          moviedata['results'][index],
                                          movieUri) ));
                              }
                            },
                          ),
                        );
                      });
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
