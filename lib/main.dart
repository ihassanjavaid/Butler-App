import 'package:bloc/bloc.dart';
import 'package:butler/secrets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:butler/bloc_observer.dart';
import 'package:butler/butler.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:media_repository/media_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = ButlerBlocObserver();
  runApp(
    Butler(
      authenticationRepository: AuthenticationRepository(),
    ),
  );
}
