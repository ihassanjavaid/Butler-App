import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:butler_app/src/models/login_model.dart';
import 'package:meta/meta.dart';

import 'package:butler_app/src/resources/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  LoginModel _loginModel;

  AuthBloc(
    this._authRepository,
  ) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield LoginState();
    } else if (event is RegisterEvent) {
      yield RegisterState();
    } else if (event is InfoEntryEvent) {
      if (_loginModel == null) {
        _loginModel = LoginModel();
      }
      if (event.infoType == InfoType.Email) {
        _loginModel.email = event.info;
      } else {
        _loginModel.password = event.info;
      }
    } else if (event is AttemptAuthEvent) {
      try {
        yield AuthLoading();
        if (event.authType == AuthType.Login) {
          _authRepository.login(_loginModel);
        } else {
          _authRepository.register(_loginModel);
        }
        yield AuthSuccess();
      } catch (err) {
        yield AuthFailure();
      }
    }
  }
}
