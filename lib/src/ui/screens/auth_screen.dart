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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Spacer(),
              CircleAvatar(
                child: Text('T'),
                radius: 46.0,
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
                onPressed: () {},
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

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    Key key,
    @required this.onPressed,
    @required this.buttonText,
    this.buttonTextColour,
    this.buttonColour = Colors.white,
    this.buttonBorderRadius = 44.0,
  }) : super(key: key);

  final String buttonText;
  final Color buttonTextColour;
  final Color buttonColour;
  final double buttonBorderRadius;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(
        this.buttonText,
        style: kButtonTextStyle.copyWith(
          color: this.buttonTextColour,
        ),
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.black,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(this.buttonColour),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.buttonBorderRadius),
          ),
        ),
      ),
    );
  }
}
