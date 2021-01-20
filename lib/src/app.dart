import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LandingScreen.id: (context) => LandingScreen(),
        AuthScreen.id: (context) => AuthScreen(),
      },
      initialRoute: AuthScreen.id,
    );
  }
}
