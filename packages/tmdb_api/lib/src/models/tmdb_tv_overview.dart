import 'package:json_annotation/json_annotation.dart';

part 'tmdb_tv_overview.g.dart';

/// {@template word}
/// TVOverview returned by The Movie Database API.
/// Each [TMDBTVOverview] contains the Movie [id], [video], [title], [popularity], [adult], [overview], [posterPath], [releaseData], [voteCount], [voteAverage], [originalLanguage], [originalTitle], [genreIds] & [backdropPath].
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class TMDBTVOverview {
  /// {@macro TMDBTVOverview}.
  const TMDBTVOverview({
    this.voteCount,
    this.id,
    this.voteAverage,
    this.name,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalName,
    this.genreIds,
    this.backdropPath,
    this.overview,
    this.firstAirDate,
    this.originCountry,
  });

  /// Converts a [Map<String, dynamic>] into a [TMDBTVOverview] instance.
  factory TMDBTVOverview.fromJson(Map<String, dynamic> json) =>
      _$TMDBTVOverviewFromJson(json);

  /// Properties list.
  final int id;
  final String name;
  final double popularity;
  final String overview;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "first_air_date")
  final String firstAirDate;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: 'origin_country')
  final List<String> originCountry;
  @JsonKey(name: "original_name")
  final String originalName;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
}
