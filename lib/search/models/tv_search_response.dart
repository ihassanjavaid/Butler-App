import 'package:equatable/equatable.dart';
import 'tv_overview.dart';
import 'package:tmdb_repository/tmdb_repository.dart'
    hide TVSearchResponse, TVOverview;
import 'package:tmdb_repository/tmdb_repository.dart' as tmdb_repository;

/// ? Possibly delete [totalResults]. Not sure if we need it yet

class TVSearchResponse extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<TVOverview> results;

  TVSearchResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory TVSearchResponse.fromRepository(
      tmdb_repository.TVSearchResponse tvSearchResponse) {
    return TVSearchResponse(
      page: tvSearchResponse.page,
      totalPages: tvSearchResponse.totalPages,
      totalResults: tvSearchResponse.totalResults,
      results: tvSearchResponse.results
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
  }

  /// TODO: Possibly implement [MovieSearchResponse] copyWith() function

  bool get isEmpty => !hasResults();

  hasResults() {
    return results != null && results.length > 0;
  }

  /// Returns [true] if there are more results to fetch
  bool get hasMoreResults => page < totalPages;

  @override
  List<Object> get props => [
        page,
        results,
        totalResults,
        totalPages,
      ];
}
