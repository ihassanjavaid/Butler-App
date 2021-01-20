import 'package:butler_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          Text(
            'Butler',
            style: kTitleTextStyle,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
