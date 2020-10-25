import 'dart:io';

import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  final tmdbApiClient = TMDBApiClient();

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
