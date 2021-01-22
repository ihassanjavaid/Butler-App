import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:butler_app/src/models/auth_credentials.dart';
import 'package:meta/meta.dart';

import 'package:butler_app/src/resources/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthCredentials _loginModel;

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
      _updateLoginCredentials(event.credential, event.credentialType);
    } else if (event is AttemptAuthEvent) {
      try {
        yield AuthLoading();

        _performAuthentication(event.authType);

        yield AuthSuccess();
      } catch (err) {
        yield AuthFailure();
      }
    }
  }

  /// Method to update user login credentials as they are entered
  /// in the relevant text field widgets.
  ///
  void _updateLoginCredentials(
      String credential, CredentialType credentialType) {
    if (_loginModel == null) {
      _loginModel = AuthCredentials();
    }
    if (credentialType == CredentialType.Email) {
      _loginModel.updateEmail(credential);
    } else {
      _loginModel.updatePassword(credential);
    }
  }

  /// Method to invoke the relevant authentication sequence making
  /// use of the methods declared in the auth repository.
  ///
  void _performAuthentication(AuthType authType) {
    if (authType == AuthType.Login) {
      _authRepository.login(_loginModel);
    } else {
      _authRepository.register(_loginModel);
    }
  }
}
