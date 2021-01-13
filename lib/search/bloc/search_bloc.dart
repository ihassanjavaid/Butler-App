import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:butler/search/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:butler/search/search.dart';
import 'package:rxdart/rxdart.dart';
import 'package:media_repository/media_repository.dart'
    hide MovieSearchResponse, MovieOverview;

part 'search_event.dart';
part 'search_state.dart';

/// TODO: figure out a way to supply not just movies but everything else using one search bloc instead of a bloc for each type of search.

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._tmdbRepository)
      : assert(_tmdbRepository != null),
        super(const SearchState.initial());

  final MediaRepository _tmdbRepository;

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
    Stream<SearchEvent> events,
    TransitionFunction<SearchEvent, SearchState> transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 350))
        .switchMap(transitionFn);
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchTermChanged) {
      yield* _mapSearchTermChangedToState(event, state);
    }
    // if (event is FetchedMoreResults) {
    //   yield* _mapFetchedMoreResultsToState(event, state);
    // }
  }

  Stream<SearchState> _mapSearchTermChangedToState(
    SearchTermChanged event,
    SearchState state,
  ) async* {
    if (event.term.isEmpty) {
      yield const SearchState.initial();
      return;
    }

    if (state.status != SearchStatus.success) {
      yield const SearchState.loading();
    }

    try {
      final results = MovieSearchResponse.fromRepository(
          await _tmdbRepository.searchMovies(query: event.term));
      final movies = results.results;
      yield SearchState.success(movies);
    } on Exception {
      yield const SearchState.failure();
    }
  }

  // Stream<SearchState> _mapFetchedMoreResultsToState(
  //   FetchedMoreResults event,
  //   SearchState state,
  // ) async* {
  //   if (event.term.isEmpty) {
  //     yield const SearchState.initial();
  //     return;
  //   }
  // }
}
