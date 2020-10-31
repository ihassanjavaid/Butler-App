import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb_api/src/models/tmdb_tv_overview.dart';

part 'tmdb_tv_response.g.dart';

@JsonSerializable(createToJson: false)
class TMDBTVResponse {
  int page;
  List<TMDBTVOverview> results;
  @JsonKey(name: "total_results")
  int totalResults;
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "errors")
  List<String> errors;

  TMDBTVResponse({
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

  factory TMDBTVResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBTVResponseFromJson(json);
}
