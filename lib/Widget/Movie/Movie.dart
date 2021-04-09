import 'package:amazon_prime/custom_ions_icons.dart';
import 'package:flutter/material.dart';

import 'Related/RelatedMovie.dart';


class Movie extends StatelessWidget {
  Map moviedata;
  Uri movieUri;
  Movie(this.moviedata,this.movieUri);
  final _imageBaseUrl = "https://image.tmdb.org/t/p/original/";

  Widget custtomButton(String text, Icon icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: moviedata!=null ? Container(
            child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
                          child: ListView(
          
          children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                child: FadeInImage(
                  image:moviedata['backdrop_path']!=null ?
                   NetworkImage(_imageBaseUrl + moviedata['backdrop_path']):
                   AssetImage('images/prime_background.PNG'),
                  placeholder: AssetImage('images/prime_background.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 15),
                child:  Text(
                 moviedata['original_title']!=null ? moviedata['original_title'] :
                  moviedata['title']!=null ? moviedata['title']:"",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 15),
                child: Text(
                  "prime",
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 15),
                child: Text(
                  'Included with Prime',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20,right:20),
                child: Container(
                  width: size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "watch Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 23),
                  width: size.width * 0.8,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        custtomButton(
                            "Trailer",
                            Icon(
                              CustomIons.play_outline,
                              color: Colors.grey.withOpacity(0.7),
                             size: 24,
                            )),
                        custtomButton(
                            "Download",
                            Icon(
                              CustomIons.download,
                              color: Colors.grey.withOpacity(0.7),
                             size: 24,
                            )),
                        custtomButton(
                            "Watchlist",
                            Icon(
                              Icons.add,
                              color: Colors.grey.withOpacity(0.7),
                              size: 24,
                            )),
                        custtomButton(
                            "Share",
                            Icon(
                              CustomIons.share,
                               color: Colors.grey.withOpacity(0.7),
                              size: 24,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: Text(
                  moviedata['overview'],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    children: [
                      moviedata['first_air_date'] != null
                          ? Text(
                              moviedata['first_air_date']
                                  .toString()
                                  .split("-")[0],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            )
                          : moviedata['release_date'] != null
                              ? Text(
                                  moviedata['release_date']
                                      .toString()
                                      .split("-")[0],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              : Offstage(),
                      Text(
                        "  111 min   ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              border: Border.all(color: Colors.grey)),
                          child: moviedata['adult'] != null
                              ? Text(
                                  moviedata['adult'] ? " 18+ " : " 13+ ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              : Text(
                                  " 13+ ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                )),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.subtitles_outlined,
                            color: Colors.grey, size: 15),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                child: Text(
                  "Langauages: Audio(1), Subtitles(1)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 8.0),
                  width: size.width,
                  height: size.height,
                  child: RelatedMovie(movieUri))
          ],
        ),
            )):Container(
          child:Center(
            child:CircularProgressIndicator()
          )
        ),
      ),
    );
  }
}

