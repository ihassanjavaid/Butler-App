import 'dart:io';

import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final tmdbApiClient = TMDBApiClient(tmdbAPIKey: tmdbAPIKey);

  try {
    final results = await tmdbApiClient.searchMovies(
      query: "uncle",
    );
    for (var result = 0; result < results.results.length; result++) {
      print(results.results[result].posterPath);
      //print(results.results[result].overview);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
