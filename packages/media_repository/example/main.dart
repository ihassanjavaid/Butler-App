import 'dart:io';
import 'package:media_repository/media_repository.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final mediaRepository = MediaRepository(tmdbAPIKey: tmdbAPIKey);
  final String query = "The Great Gatsby";

  try {
    final results = await mediaRepository.searchMovies(
      query: query,
    );
    for (var result = 0; result < results.results.length; result++) {
      print(results.results[result].title);
      print(results.results[result].releaseDate);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
