import 'package:tmdb_api/tmdb_api.dart';
import 'package:meta/meta.dart';
import 'package:media_repository/src/models/models.dart';

/// Thrown when an error occurs while performing a searchMovies.
class SearchException implements Exception {}

/// {@template tmdb_repository}
/// A Dart class which exposes methods to implement The Movie Database functionality.
/// {@endtemplate}
class MediaRepository {
  /// {@macro tmdb_repository}
  MediaRepository({
    TMDBApiClient tmdbApiClient,
    @required String tmdbAPIKey,
  })  : assert(tmdbAPIKey != null),
        _tmdbApiClient = tmdbApiClient ?? TMDBApiClient(tmdbAPIKey: tmdbAPIKey);

  final TMDBApiClient _tmdbApiClient;

  /// Returns a list of movies for the provided [query].
  /// Other searchMovies filter can be provided as well (but are not necessary).
  /// Throws a [SearchException] if an error occurs.
  Future<MovieSearchResponse> searchMovies({
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
      return MovieSearchResponse(
        page: tmdbMovieResponse.page,
        totalPages: tmdbMovieResponse.totalPages,
        totalResults: tmdbMovieResponse.totalResults,
        results: tmdbMovieResponse.results
            .map((result) => MovieOverview(
                  id: result.id,
                  video: result.video,
                  title: result.title,
                  popularity: result.popularity,
                  adult: result.adult,
                  overview: result.overview,
                  posterPath: result.posterPath,
                  releaseDate: result.releaseDate,
                  voteCount: result.voteCount,
                  voteAverage: result.voteAverage,
                  originalLanguage: result.originalLanguage,
                  originalTitle: result.originalTitle,
                  genreIds: result.genreIds,
                  backdropPath: result.backdropPath,
                ))
            .toList(),
      );
    } on Exception {
      throw SearchException();
    }
  }

  Future<TVSearchResponse> searchTV({
    @required String query,
    String language,
    int page,
    bool includeAdult,
    int firstAirDate,
  }) async {
    assert(query != null && query.isNotEmpty);
    try {
      final tmdbMovieResponse = await _tmdbApiClient.searchTV(
        query: query,
        language: language,
        page: page,
        includeAdult: includeAdult,
        firstAirDate: firstAirDate,
      );
      return TVSearchResponse(
        page: tmdbMovieResponse.page,
        totalPages: tmdbMovieResponse.totalPages,
        totalResults: tmdbMovieResponse.totalResults,
        results: tmdbMovieResponse.results
            .map((result) => TVOverview(
                  id: result.id,
                  name: result.name,
                  originalName: result.originalName,
                  overview: result.overview,
                  voteCount: result.voteCount,
                  voteAverage: result.voteAverage,
                  popularity: result.popularity,
                  originalLanguage: result.originalLanguage,
                  genreIds: result.genreIds,
                  posterPath: result.posterPath,
                  backdropPath: result.backdropPath,
                  firstAirDate: result.firstAirDate,
                  originCountry: result.originCountry,
                ))
            .toList(),
      );
    } on Exception {
      throw SearchException();
    }
  }
}
