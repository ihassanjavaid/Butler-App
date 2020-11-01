import 'package:equatable/equatable.dart';
import 'movie_overview.dart';
import 'package:tmdb_repository/tmdb_repository.dart'
    hide MovieSearchResponse, MovieOverview;
import 'package:tmdb_repository/tmdb_repository.dart' as tmdb_repository;

/// ? Possibly delete [totalResults]. Not sure if we need it yet

class MovieSearchResponse extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieOverview> results;

  MovieSearchResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory MovieSearchResponse.fromRepository(
      tmdb_repository.MovieSearchResponse movieSearchResponse) {
    return MovieSearchResponse(
      page: movieSearchResponse.page,
      totalPages: movieSearchResponse.totalPages,
      totalResults: movieSearchResponse.totalResults,
      results: movieSearchResponse.results
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
  }

  ///
  /// TODO: Possible add fucntions for hasReached max like in the Repo layer models
  bool get isEmpty => !hasResults();

  hasResults() {
    return results != null && results.length > 0;
  }

  /// Returns [true] if there are more results to fetch
  bool get hasMoreResults => page < totalPages;

  @override
  List<Object> get props => [
        page,
        totalResults,
        totalPages,
        results,
      ];
}
