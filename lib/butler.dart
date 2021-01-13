import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:butler/search/search.dart';
import 'package:butler/authentication/authentication.dart';
import 'package:butler/theme.dart';
import 'package:butler/splash/splash.dart';
import 'package:butler/login/login.dart';

import 'package:media_repository/media_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

class Butler extends StatelessWidget {
  const Butler({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  SearchPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

///TODO: figure out best way to inject [TMDBRepository] to widget tree. You will need to inject more repos as well so think about that
// @override
// Widget build(BuildContext context) {
//   return RepositoryProvider.value(
//     value: _tmdbRepository,
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         appBarTheme: const AppBarTheme(
//           brightness: Brightness.dark,
//           color: Colors.transparent,
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.black87),
//         ),
//         textTheme: GoogleFonts.nunitoTextTheme(),
//       ),
//       home: SearchPage(),
//     ),
//   );
// }
