import 'dart:html';

import 'package:equatable/equatable.dart';
import 'movie_overview.dart';

class MoviesResponse extends Equatable {
  final int page;
  final List<MovieOverview> results;
  final int totalResults;
  final int totalPages;
  final List<String> errors;

  MoviesResponse(
      {this.page,
      this.totalResults,
      this.totalPages,
      this.results,
      this.errors});

  @override
  List<Object> get props => [page, totalResults, totalPages, results, errors];
}
