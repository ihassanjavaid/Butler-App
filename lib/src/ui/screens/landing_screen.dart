import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:butler_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static const String id = 'landing_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Spacer(),
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  child: Text('B'),
                  radius: 46.0,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Butler',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              RoundedRectangleButton(
                onPressed: () {
                  Navigator.pushNamed(context, AuthScreen.id);
                },
                buttonText: 'Login',
                buttonColour: Colors.black,
                buttonTextColour: Colors.white,
              ),

              RoundedRectangleButton(
                onPressed: () {},
                buttonText: 'Sign up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
