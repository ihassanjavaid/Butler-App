part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class MovieMenu extends MenuState {}

class PodcastMenu extends MenuState {}

class MusicMenu extends MenuState {}

class GameMenu extends MenuState {}
