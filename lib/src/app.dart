import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/screens/landing_screen.dart';
import 'package:butler_app/src/ui/screens/library_screen.dart';
import 'package:butler_app/src/ui/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LandingScreen.id: (context) => LandingScreen(),
        AuthScreen.id: (context) => AuthScreen(),
        MenuScreen.id: (context) => MenuScreen(),
        LibraryScreen.id: (context) => LibraryScreen(),
      },
      initialRoute: LandingScreen.id,
    );
  }
}
