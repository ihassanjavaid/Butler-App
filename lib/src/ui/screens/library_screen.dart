import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/resources/menu_repository.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/resources/utilities/searchtype_enum.dart';
import 'package:butler_app/src/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatefulWidget {
  static const String id = 'library_screen';
  final SearchType searchType;

  LibraryScreen([this.searchType]);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
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
              child: Search(),
            ),
          ],
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
              color: kGreyColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.menu_book,
              color: kGreyColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.queue_music,
              color: kGreyColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.videogame_asset,
              color: kGreyColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.movie,
              color: kGreyColor,
              size: 30,
            ),
          ),
        ],
      );
    });
  }

  Color _getIconColour(MenuState state, IconType iconType) {
    if (state is MovieState) {}
  }
}
