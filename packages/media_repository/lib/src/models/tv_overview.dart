import 'package:equatable/equatable.dart';

/// {@template word}
/// TVOverview returned by The Movie Database API.
/// Each [TMDBTVOverview] contains the Movie [id], [video], [title], [popularity], [adult], [overview], [posterPath], [releaseData], [voteCount], [voteAverage], [originalLanguage], [originalTitle], [genreIds] & [backdropPath].
/// {@endtemplate}
class TVOverview extends Equatable {
  /// {@macro TMDBTVOverview}.
  const TVOverview({
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.originalLanguage,
    this.genreIds,
    this.posterPath,
    this.backdropPath,
    this.firstAirDate,
    this.originCountry,
  });

  /// Properties list.
  final int id;
  final String name;
  final double popularity;
  final String overview;
  final String posterPath;
  final String firstAirDate;
  final int voteCount;
  final double voteAverage;
  final String originalLanguage;
  final List<String> originCountry;
  final String originalName;
  final List<int> genreIds;
  final String backdropPath;

  @override
  List<Object> get props => [
        id,
        name,
        popularity,
        overview,
        posterPath,
        firstAirDate,
        voteCount,
        voteAverage,
        originalLanguage,
        originCountry,
        originalName,
        genreIds,
        backdropPath,
      ];
}
