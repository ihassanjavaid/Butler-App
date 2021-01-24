import 'package:auto_size_text/auto_size_text.dart';
import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/models/genre_model.dart';
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
              Row(
                children: [
                  Container(
                    width: size.width - 80,
                    child: Material(
                      child: Search(
                        onChanged: (val) {
                          BlocProvider.of<LibraryBloc>(context)
                              .add(SearchEntryEvent(val));
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: 40,
                      child: FloatingActionButton(
                        child: Icon(Icons.search),
                        backgroundColor: kSelectedIconColour,
                        onPressed: () {
                          BlocProvider.of<LibraryBloc>(context)
                              .add(SearchEvent());
                        },
                      ))
                ],
              ),
              // TextButton(
              //   onPressed: () {
              //     BlocProvider.of<LibraryBloc>(context).add(SearchEvent());
              //   },
              //   child: Text('Search'),
              // ),
              Expanded(
                child:
                    BlocBuilder<LibraryBloc, LibraryState>(builder: (_, state) {
                  List<Results> result = [];
                  if (state is SearchingLibrary) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: kSelectedIconColour,
                      ),
                    );
                  } else if (state is ResultState) {
                    result = state.movieSearchResult.results;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          /*return Text(
                            result[index].title,
                            style: TextStyle(color: Colors.white),
                          );*/
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1.0),
                                    child: Container(
                                      width: 1,
                                      height: 100,
                                      color: kSelectedIconColour,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: kDefaultIconColour),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.width - 150,
                                          child: AutoSizeText(
                                            result[index].title,
                                            style: TextStyle(
                                                color: kDefaultIconColour,
                                                fontSize: 20),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            minFontSize: 18,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: Text(
                                            'Popularity: ${(result[index].popularity / 10).toStringAsFixed(1)}',
                                            style: TextStyle(
                                                color: kDefaultIconColour,
                                                fontSize: 12),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: Text(
                                            'Release Date: ${(result[index].releaseDate)}',
                                            style: TextStyle(
                                                color: kDefaultIconColour,
                                                fontSize: 12),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 66,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(22),
                                                    color: kDullBlueColor),
                                                child: Center(
                                                  child: Text(
                                                    MovieGenre.getGenreName(
                                                        result[index]
                                                            .genreIds[0]),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            kDefaultIconColour),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: 66,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(22),
                                                    color: kDullBlueColor),
                                                child: Center(
                                                  child: Text(
                                                    MovieGenre.getGenreName(
                                                        result[index]
                                                            .genreIds[1]),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            kDefaultIconColour),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                    ),
                                  )
                                  // SizedBox(
                                  //   child: ListTile(
                                  //     leading: Container(
                                  //       height: 120,
                                  //       width: 80,
                                  //       decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(8),
                                  //           color: kDefaultIconColour
                                  //       ),
                                  //     ),
                                  //     title: AutoSizeText(
                                  //       result[index].title,
                                  //       style: TextStyle(color: kDefaultIconColour, fontSize: 20),
                                  //       maxLines: 1,
                                  //       overflow: TextOverflow.ellipsis,
                                  //       minFontSize: 18,
                                  //     ),
                                  //     subtitle: Padding(
                                  //       padding: const EdgeInsets.only(top: 6.0),
                                  //       child: Row(
                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                  //         children: [
                                  //           Container(
                                  //             width: 66,
                                  //             height: 18,
                                  //             decoration: BoxDecoration(
                                  //               borderRadius: BorderRadius.circular(22),
                                  //               color: kDullBlueColor
                                  //             ),
                                  //             child: Center(
                                  //               child: Text(
                                  //                 MovieGenre.getGenreName(result[index].genreIds[0]),
                                  //                 style: TextStyle(
                                  //                   fontSize: 12,
                                  //                   color: kDefaultIconColour
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //             width: 10,
                                  //           ),
                                  //           Container(
                                  //             width: 66,
                                  //             height: 18,
                                  //             decoration: BoxDecoration(
                                  //                 borderRadius: BorderRadius.circular(22),
                                  //                 color: kDullBlueColor
                                  //             ),
                                  //             child: Center(
                                  //               child: Text(
                                  //                 MovieGenre.getGenreName(result[index].genreIds[1]),
                                  //                 style: TextStyle(
                                  //                     fontSize: 12,
                                  //                     color: kDefaultIconColour
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     trailing: Icon(
                                  //       Icons.add,
                                  //       color: kDefaultIconColour,
                                  //     ),
                                  //   ),
                                  //   width: size.width - 26,
                                  //   height: 60,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                        itemCount: result.length,
                      ),
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
