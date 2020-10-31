import 'package:intl/intl.dart';

/// {@template word}
/// MovieOverview returned by The Movie Database API.
/// Each [TMDBMovieOverview] contains the Movie [id], [video], [title], [popularity], [adult], [overview], [posterPath], [releaseData], [voteCount], [voteAverage], [originalLanguage], [originalTitle], [genreIds] & [backdropPath].
/// {@endtemplate}
class MovieOverview {
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

  /// Called from within [parseReleaseDate()] it returns the release year
  String getReleaseYear() {
    return releaseDate.split("-")[0];
  }

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
