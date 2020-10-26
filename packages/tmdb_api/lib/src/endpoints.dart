import 'package:tmdb_api/src/constants.dart';

const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

class Endpoints {
  static String movieSearchUrl(String query) {
    //return "$TMDB_API_BASE_URL/search/movie?query=$query&api_key=$TMDB_API_KEY";
    return "$TMDB_API_BASE_URL/search/movie?language=en-US&query=$query&include_adult=false";
  }

  // static String movieSearchUrl(String query, String apiKey) {
  //   //return "$TMDB_API_BASE_URL/search/movie?query=$query&api_key=$TMDB_API_KEY";
  //   return "$TMDB_API_BASE_URL/search/movie?language=en-US&query=$query&include_adult=false&api_key=$TMDB_API_KEY";
  // }
}
