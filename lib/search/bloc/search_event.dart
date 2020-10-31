part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchTermChanged extends SearchEvent {
  const SearchTermChanged(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}

class SearchFetchedMore extends SearchEvent {}
