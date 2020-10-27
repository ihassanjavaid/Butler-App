import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb_api/src/models/tmdb_movie_overview.dart';

part 'tmdb_movie_response.g.dart';

@JsonSerializable(createToJson: false)
class TMDBMovieResponse {
  int page;
  List<TMDBMovieOverview> results;
  @JsonKey(name: "total_results")
  int totalResults;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "errors")
  List<String> errors;

  TMDBMovieResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
    this.errors,
  });

  bool get isEmpty => !hasResults();

  hasResults() {
    return results != null && results.length > 0;
  }

  hasErrors() {
    return errors != null && errors.length > 0;
  }

  factory TMDBMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieResponseFromJson(json);
}
