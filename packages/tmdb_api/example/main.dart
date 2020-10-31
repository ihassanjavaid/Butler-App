import 'dart:io';
import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final tmdbApiClient = TMDBApiClient(tmdbAPIKey: tmdbAPIKey);
  final String query = "Mad Men";

  try {
    final searchResponse = await tmdbApiClient.searchTV(
      query: query,
    );

    print("total results: ${searchResponse.totalResults}");
    print("total pages: ${searchResponse.totalPages}");
    print("current page: ${searchResponse.page}");

    for (var index = 0; index < searchResponse.results.length; index++) {
      print(searchResponse.results[index].name);
      print(searchResponse.results[index].overview);
      print(searchResponse.results[index].genreIds);
      print(searchResponse.results[index].posterPath);
      print(searchResponse.results[index].popularity);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
