part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MovieEvent extends MenuEvent {}

class PodcastEvent extends MenuEvent {}

class MusicEvent extends MenuEvent {}

class GameEvent extends MenuEvent {}
