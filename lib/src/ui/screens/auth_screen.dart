import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/ui/widgets/modified_text_field.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:butler_app/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

              Expanded(
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, state) {
                    List<Widget> children = [];

                    if (state is AuthLogin) {
                      children = getLoginWidgets(context);
                    } else if (state is AuthRegister) {
                      children = getRegistrationWidgets(context);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: children,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getLoginWidgets(BuildContext context) {
    return [
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
      ),
      ModifiedTextField(
        label: 'Password',
        obscureText: true,
        borderRadius: 44.0,
      ),
      RoundedRectangleButton(
        onPressed: () {},
        buttonText: 'Login',
        buttonColour: Colors.black,
        buttonTextColour: Colors.white,
      ),
    ];
  }

  List<Widget> getRegistrationWidgets(BuildContext context) {
    return [
      // TODO add the registration fields
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
      ),
      ModifiedTextField(
        label: 'Password',
        obscureText: true,
        borderRadius: 44.0,
      ),
      RoundedRectangleButton(
        onPressed: () {},
        buttonText: 'Register',
        buttonColour: Colors.black,
        buttonTextColour: Colors.white,
      ),
    ];
  }
}
