part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  const SearchState._({
    this.status = SearchStatus.initial,
    this.movieOverview = const <MovieOverview>[],
  });

  const SearchState.initial() : this._();

  const SearchState.loading() : this._(status: SearchStatus.loading);

  const SearchState.success(List<MovieOverview> movieOverview)
      : this._(status: SearchStatus.success, movieOverview: movieOverview);

  const SearchState.failure() : this._(status: SearchStatus.failure);

  final SearchStatus status;
  final List<MovieOverview> movieOverview;

  @override
  List<Object> get props => [status, movieOverview];
}
