import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/library_screen.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is MenuInitial) {
          // Do nothing
        } else {
          Navigator.pushNamed(context, LibraryScreen.id);
        }
      },
      child: Container(
        height: size.height,
        width: size.width,
        color: kBackgroundColor,
        child: Center(
          child: CircularMenu(
            alignment: Alignment.center,
            radius: 100,
            animationDuration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            reverseCurve: Curves.fastOutSlowIn,
            startingAngleInRadian: 0,
            endingAngleInRadian: 5.3,
            // main button
            toggleButtonColor: kBackgroundColor,
            toggleButtonBoxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 10,
              ),
            ],
            toggleButtonIconColor: kGreyColor,
            toggleButtonMargin: 10.0,
            toggleButtonPadding: 20.0,
            toggleButtonSize: 48.0,
            toggleButtonAnimatedIconData: AnimatedIcons.search_ellipsis,
            items: [
              CircularMenuItem(
                onTap: () {
                  BlocProvider.of<MenuBloc>(context).add(MovieEvent());
                },
                icon: Icons.movie,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  BlocProvider.of<MenuBloc>(context).add(BookEvent());
                },
                icon: Icons.menu_book,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  BlocProvider.of<MenuBloc>(context).add(MusicEvent());
                },
                icon: Icons.queue_music,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  BlocProvider.of<MenuBloc>(context).add(GameEvent());
                },
                icon: Icons.videogame_asset,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {},
                icon: Icons.tv,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  // Navigator.pushNamed(context, LibraryScreen.id);
                },
                icon: Icons.mic,
                color: kBackgroundColor,
                iconSize: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
