import 'dart:io';

import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  final String tmdbAPIKey = "59a3a927d44125cb8b5788a5013b294a";

  final tmdbApiClient = TMDBApiClient(tmdbAPIKey: tmdbAPIKey);

  /// TODO: Write example code for TMDBApiClient use
  try {
    final words = await tmdbApiClient.words(meansLike: 'cats', max: 1);
    for (final word in words) {
      print(word.word);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
