import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:butler/search/search.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/fluttersaurus.png', width: 48),
                const SizedBox(width: 8),
                Text(
                  'Butler',
                  style: textTheme.headline4.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Flexible(
              child: BlocProvider(
                create: (context) => SearchBloc(
                  context.repository<TMDBRepository>(),
                ),
                child: SearchForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
