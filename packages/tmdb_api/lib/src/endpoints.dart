import 'package:tmdb_api/src/constants.dart';

const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

class Endpoints {
  static String movieSearchUrl(String query, String apiKey) {
    //return "$TMDB_API_BASE_URL/search/movie?query=$query&api_key=$TMDB_API_KEY";
    return "$TMDB_API_BASE_URL/search/movie?api_key=$TMDB_API_KEY&language=en-US&query=$query&include_adult=false";
  }
}


String link1 = '$TMDB_API_BASE_URL/search/movie?language=en-US&query=The%20Hangover&include_adult=false';
return "$TMDB_API_BASE_URL/search/movie?api_key=$TMDB_API_KEY&language=en-US&query=$query&include_adult=false";