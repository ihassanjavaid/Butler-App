import 'dart:io';

import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final tmdbApiClient = TMDBApiClient(tmdbAPIKey: tmdbAPIKey);

  try {
    final movies = await tmdbApiClient.searchMovies(query: "The Hangover");
    for (final movie in movies) {
      print(movie.title);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
