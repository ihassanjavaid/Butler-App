import 'dart:io';
import 'package:tmdb_repository/tmdb_repository.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final tmdbRepository = TMDBRepository(tmdbAPIKey: tmdbAPIKey);
  final String query = "The Hangover";

  try {
    final results = await tmdbRepository.search(
      query: query,
    );
    for (var result = 0; result < results.results.length; result++) {
      print(results.results[result].title);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
