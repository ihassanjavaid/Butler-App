import 'package:bloc/bloc.dart';
import 'package:butler/secrets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:butler/bloc_observer.dart';
import 'package:butler/butler.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = ButlerBlocObserver();
  runApp(
    Butler(
      tmdbRepository: TMDBRepository(tmdbAPIKey: tmdbAPIKey),
    ),
  );
}
