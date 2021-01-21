import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/resources/auth_repository.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/menu_screen.dart';
import 'package:butler_app/src/ui/widgets/modified_text_field.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Container(
              constraints: constraints,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AuthSuccess) {
                    // Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, MenuScreen.id);
                  }
                  return getContent(context);
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getContent(BuildContext context) {
    return Column(
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
        Expanded(
          flex: 2,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (_, state) {
              List<Widget> children = [];

              if (state is LoginState) {
                children = getLoginWidgets(context);
              } else if (state is RegisterState) {
                children = getRegistrationWidgets(context);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
              );
            },
          ),
        ),
        Spacer(),
        BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
          String buttonText;
          AuthType authType;
          if (state is LoginState) {
            buttonText = 'Login';
            authType = AuthType.Login;
          } else if (state is RegisterState) {
            buttonText = 'Register';
            authType = AuthType.Register;
          }

          return RoundedRectangleButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context)
                  .add(AttemptAuthEvent(authType));
            },
            buttonText: buttonText ?? '',
            buttonColour: Colors.black,
            buttonTextColour: Colors.white,
          );
        })
      ],
    );
  }

  List<Widget> getLoginWidgets(BuildContext context) {
    return [
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
        prefixIcon: Icon(Icons.mail),
        onChanged: (val) {
          BlocProvider.of<AuthBloc>(context).add(InfoEntryEvent(
            val,
            InfoType.Email,
          ));
        },
      ),
      ModifiedTextField(
        label: 'Password',
        obscureText: true,
        borderRadius: 44.0,
        onChanged: (val) {
          BlocProvider.of<AuthBloc>(context).add(InfoEntryEvent(
            val,
            InfoType.Password,
          ));
        },
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
        prefixIcon: Icon(Icons.mail),
      ),
      ModifiedTextField(
        label: 'Password',
        obscureText: true,
        borderRadius: 44.0,
      ),
    ];
  }
}
