import 'package:flutter/widgets.dart';

class Allurls {
  static Uri fetchTrending = Uri.https(
      'api.themoviedb.org',
      '/3/trending/all/week',
      {'api_key': 'bcfa6c440dece238c4646cee7dd93d9e', 'language': 'en-US'});

  static Uri feachHororMovie = Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {'api_key': 'bcfa6c440dece238c4646cee7dd93d9e', 'with_genres': '27'});
  static Uri kannadamovie =
      Uri.https('api.themoviedb.org', '/3/discover/movie', {
    'api_key': 'bcfa6c440dece238c4646cee7dd93d9e',
    'region': 'IN',
    'language': 'kn-IN',
    'release_date.gte': '2017-08-01',
    'with_release_type': '3|2',
    'with_original_language': 'kn'
  });
  static Uri tamilumovie =
      Uri.https('api.themoviedb.org', '/3/discover/movie', {
    'api_key': 'bcfa6c440dece238c4646cee7dd93d9e',
    'region': 'IN',
    'language': 'ta-IN',
    'release_date.gte': '2017-08-01',
    'with_release_type': '3|2',
    'with_original_language': 'ta'
  });
    static Uri telugumovie =
      Uri.https('api.themoviedb.org', '/3/discover/movie', {
    'api_key': 'bcfa6c440dece238c4646cee7dd93d9e',
    'region': 'IN',
    'language': 'te-IN',
    'release_date.gte': '2017-08-01',
    'with_release_type': '3|2',
    'with_original_language': 'te'
  });
   static Uri malayalammovie =
      Uri.https('api.themoviedb.org', '/3/discover/movie', {
    'api_key': 'bcfa6c440dece238c4646cee7dd93d9e',
    'region': 'IN',
    'language': 'ml-IN',
    'release_date.gte': '2017-08-01',
    'with_release_type': '3|2',
    'with_original_language': 'ml'
  });
    static Uri feachComedyMovies = Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {'api_key': 'bcfa6c440dece238c4646cee7dd93d9e', 'with_genres': '35'});
 static Uri feachScifi = Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {'api_key': 'bcfa6c440dece238c4646cee7dd93d9e', 'with_genres': '878'});
}
