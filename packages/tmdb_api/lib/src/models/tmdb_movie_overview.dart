import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// TODO: Use json serializable to create this package
part 'tmdb_movie_overview.g.dart';

/// {@template word}
/// MovieOverview returned by The Movie Database API.
/// Each [TMDBMovieOverview] contains the Movie [id], [video], [title], [popularity], [adult], [overview], [posterPath], [releaseData], [voteCount], [voteAverage], [originalLanguage], [originalTitle], [genreIds] & [backdropPath].
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class TMDBMovieOverview {
  /// {@macro TMDBMovieOverview}.
  const TMDBMovieOverview(
      {this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  /// Converts a [Map<String, dynamic>] into a [TMDBMovieOverview] instance.
  factory TMDBMovieOverview.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieOverviewFromJson(json);

  /// Properties list.
  final int id;
  final bool video;
  final String title;
  final double popularity;
  final bool adult;
  final String overview;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;

  /// TODO: move this from the API data model to the app model when you set up the app data model
  /// Called from within [parseReleaseDate()] it returns the release year
  String getReleaseYear() {
    return releaseDate.split("-")[0];
  }

  /// TODO: move this from the API data model to the app model when you set up the app data model
  /// Takes the release date, formats and returns the future release date or the past release year
  String parseReleaseDate() {
    try {
      var parsedReleasedDate = DateFormat("yyyy-M-dd").parse(releaseDate);
      bool isInTheFuture = parsedReleasedDate.isAfter(DateTime.now());
      if (isInTheFuture) {
        return "${DateFormat("MMM dd yyyy").format(parsedReleasedDate)}";
      } else {
        return getReleaseYear();
      }
    } on Exception {
      return "";
    }
  }
}
