import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/library_screen.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: kBackgroundColor,
      child: Center(
        child: CircularMenu(
          alignment: Alignment.center,
          radius: 100,
          animationDuration: Duration(milliseconds: 2000),
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
              onTap: () {},
              icon: Icons.movie,
              color: kBackgroundColor,
              iconSize: 42,
            ),
            CircularMenuItem(
              onTap: () {},
              icon: Icons.menu_book,
              color: kBackgroundColor,
              iconSize: 42,
            ),
            CircularMenuItem(
              onTap: () {},
              icon: Icons.queue_music,
              color: kBackgroundColor,
              iconSize: 42,
            ),
            CircularMenuItem(
              onTap: () {},
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
                Navigator.pushNamed(context, LibraryScreen.id);
              },
              icon: FontAwesomeIcons.user,
              color: kBackgroundColor,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
