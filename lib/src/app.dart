import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/resources/auth_repository.dart';
import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/screens/landing_screen.dart';
import 'package:butler_app/src/ui/screens/library_screen.dart';
import 'package:butler_app/src/ui/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (_) => MenuBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LandingScreen.id: (context) => LandingScreen(),
          AuthScreen.id: (context) => AuthScreen(),
          MenuScreen.id: (context) => MenuScreen(),
          LibraryScreen.id: (context) => LibraryScreen(),
        },
        initialRoute: MenuScreen.id, // TODO fix route after dev
      ),
    );
  }
}
