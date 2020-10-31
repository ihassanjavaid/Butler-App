import 'package:tmdb_api/tmdb_api.dart';
import 'package:meta/meta.dart';

/// Thrown when an error occurs while performing a searchMovies.
class SearchException implements Exception {}

/// {@template tmdb_repository}
/// A Dart class which exposes methods to implement The Movie Database functionality.
/// {@endtemplate}
class TMDBRepository {
  /// {@macro tmdb_repository}
  TMDBRepository({
    TMDBApiClient tmdbApiClient,
    @required String tmdbAPIKey,
  })  : assert(tmdbAPIKey != null),
        _tmdbApiClient = tmdbApiClient ?? TMDBApiClient(tmdbAPIKey: tmdbAPIKey);

  final TMDBApiClient _tmdbApiClient;

  /// Returns a list of movies for the provided [query].
  /// Other searchMovies filter can be provided as well (but are not necessary).
  /// Throws a [SearchException] if an error occurs.
  Future<TMDBMovieResponse> searchMovies({
    @required String query,
    String language,
    int page,
    bool includeAdult,
    String region,
    int year,
    int primaryReleaseYear,
  }) async {
    assert(query != null && query.isNotEmpty);
    try {
      final tmdbMovieResponse = await _tmdbApiClient.searchMovies(
        query: query,
        language: language,
        page: page,
        includeAdult: includeAdult,
        region: region,
        year: year,
        primaryReleaseYear: primaryReleaseYear,
      );
      return tmdbMovieResponse;
    } on Exception {
      throw SearchException();
    }
  }
}
