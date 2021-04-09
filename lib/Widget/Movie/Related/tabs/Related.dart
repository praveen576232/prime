import 'package:flutter/material.dart';

import '../../../MovieListWidget.dart';

class Related extends StatelessWidget {
  Uri movieuri;
  Related(this.movieuri);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: MovieListWidget("Customers also watched", movieuri),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0,bottom:8.0),
            child: Text("Cast",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Text("We don't have any cast information.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}
