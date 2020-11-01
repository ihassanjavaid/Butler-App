import 'package:flutter/material.dart';
import 'package:butler/search/search.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key key,
    this.onTap,
    this.movies = const <MovieOverview>[],
  }) : super(key: key);

  final ValueSetter<MovieOverview> onTap;
  final List<MovieOverview> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) => _SearchResult(
        movie: movies[index],
        onTap: () => onTap(movies[index]),
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({
    Key key,
    this.movie,
    this.onTap,
  }) : super(key: key);

  final MovieOverview movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.grey[800],
      child: ListTile(
        // visualDensity: VisualDensity.compact,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          movie.releaseDate,
          style: TextStyle(color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}
