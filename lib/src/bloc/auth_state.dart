part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {}

class AuthRegister extends AuthState {}
