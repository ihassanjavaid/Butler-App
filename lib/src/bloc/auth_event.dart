part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class AttemptAuthEvent extends AuthEvent {
  final AuthType authType;

  AttemptAuthEvent(this.authType);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AttemptAuthEvent && o.authType == authType;
  }

  @override
  int get hashCode => authType.hashCode;
}

class InfoEntryEvent extends AuthEvent {
  final String credential;
  final InfoType credentialType;

  InfoEntryEvent(this.credential, this.credentialType);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InfoEntryEvent &&
        o.credential == credential &&
        o.credentialType == credentialType;
  }

  @override
  int get hashCode => credential.hashCode ^ credentialType.hashCode;
}

class InfoEnteredEvent extends AuthEvent {}
