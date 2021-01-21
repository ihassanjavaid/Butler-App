import 'package:butler_app/src/ui/widgets/modified_text_field.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:butler_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  child: Text('B'),
                  radius: 36.0,
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
              ModifiedTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24.0,
              ),
              ModifiedTextField(label: 'Password'),
              Spacer(),
              RoundedRectangleButton(
                onPressed: () {},
                buttonText: 'Login',
                buttonColour: Colors.black,
                buttonTextColour: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
