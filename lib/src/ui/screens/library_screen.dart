import 'package:butler_app/src/ui/widgets/search_bar.dart';
import 'package:butler_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  static const String id = 'library_screen';

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 24 - 10,
            ),
            Row(
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
                SizedBox(
                  width: size.width / 24,
                ),
              ],
            ),
            SizedBox(
              height: size.height/24 - 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Material(child: Search()),
            ),
          ],
        ),
      ),
    );
  }
}
