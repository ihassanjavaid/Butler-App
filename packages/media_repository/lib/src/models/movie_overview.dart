import 'package:equatable/equatable.dart';

/// {@template word}
/// MovieOverview returned by The Movie Database API.
/// Each [MovieOverview] contains the Movie [id], [video], [title], [popularity], [adult], [overview], [posterPath], [releaseData], [voteCount], [voteAverage], [originalLanguage], [originalTitle], [genreIds] & [backdropPath].
/// {@endtemplate}
class MovieOverview extends Equatable {
  /// {@macro TMDBMovieOverview}.
  const MovieOverview(
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

  /// Properties list.
  final int id;
  final bool video;
  final String title;
  final double popularity;
  final bool adult;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int voteCount;
  final double voteAverage;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;

  @override
  List<Object> get props => [
        id,
        video,
        title,
        popularity,
        adult,
        overview,
        posterPath,
        releaseDate,
        voteCount,
        voteAverage,
        originalLanguage,
        originalTitle,
        genreIds,
        backdropPath,
      ];
}
