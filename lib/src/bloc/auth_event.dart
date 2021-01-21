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
  final String info;
  final InfoType infoType;

  InfoEntryEvent(
    this.info,
    this.infoType,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InfoEntryEvent && o.info == info && o.infoType == infoType;
  }

  @override
  int get hashCode => info.hashCode ^ infoType.hashCode;
}

class InfoEnteredEvent extends AuthEvent {}
