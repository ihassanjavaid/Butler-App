import 'package:equatable/equatable.dart';
import 'movie_overview.dart';

class MovieSearchResponse extends Equatable {
  final int page;
  final List<MovieOverview> results;
  final int totalResults;
  final int totalPages;

  MovieSearchResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

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
