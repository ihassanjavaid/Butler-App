import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/resources/services/movie_service.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatelessWidget {
  static const String id = 'library_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 12.0,
          ),
          height: size.height,
          width: size.width,
          color: kBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getNavLinks(),
              SizedBox(
                height: size.height / 24 - 10,
              ),
              Material(
                child: Search(
                  onChanged: (val) {
                    BlocProvider.of<LibraryBloc>(context)
                        .add(SearchEntryEvent(val));
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<LibraryBloc>(context).add(SearchEvent());
                },
                child: Text('Search'),
              ),
              Expanded(
                child:
                    BlocBuilder<LibraryBloc, LibraryState>(builder: (_, state) {
                  List<Results> result = [];
                  if (state is SearchingLibrary) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ResultState) {
                    result = state.movieSearchResult.results;
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return Text(
                          result[index].title,
                          style: TextStyle(color: Colors.white),
                        );
                      },
                      itemCount: result.length,
                    );
                  }
                  return Container();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getNavLinks() {
    return BlocBuilder<MenuBloc, MenuState>(builder: (_, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.movie,
              color: state is MovieState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.menu_book,
              color:
                  state is BookState ? kSelectedIconColour : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.queue_music,
              color: state is MusicState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.videogame_asset,
              color:
                  state is GameState ? kSelectedIconColour : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.tv,
              color: state is TVShowState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.mic,
              color: state is PodcastState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
        ],
      );
    });
  }
}
