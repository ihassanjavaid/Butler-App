import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:butler/search/search.dart';
import 'package:tmdb_repository/tmdb_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class Butler extends StatelessWidget {
  const Butler({
    Key key,
    @required TMDBRepository tmdbRepository,
  })  : assert(TMDBRepository != null),
        _tmdbRepository = tmdbRepository,
        super(key: key);

  final TMDBRepository _tmdbRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _tmdbRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            brightness: Brightness.light,
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
          ),
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        // home: SearchPage(),
      ),
    );
  }
}
