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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _setupPageContent(context),
        ),
      ),
    );
  }

  /// Method reponsible for setting up the screen content based on
  /// the current event. If the event is of login type, the method
  /// will populate the screen with login widgets while if the event
  /// is register, the method will populate the screen with
  /// registeration widgets.
  ///
  Widget _setupPageContent(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (_, state) {
        Widget contentWidget;

        if (state is LoginState) {
          contentWidget = _getContentWidget(context, AuthType.Login);
        } else if (state is RegisterState) {
          contentWidget = _getContentWidget(context, AuthType.Register);
        } else if (state is AuthLoading) {
          contentWidget = _getLoadingWidget();
        }
        return contentWidget;
      },
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, MenuScreen.id);
        }
      },
    );
  }

  /// Method responsible for returning the circular progress indicator.
  ///
  Widget _getLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getContentWidget(BuildContext context, AuthType authType) {
    return ListView(
      children: _getContentWidgets(context, authType),
    );
  }

  /// Method responsible for returning the list of widgets based on the
  /// current state i.e. returning login widgets for login state and
  /// register widgets for register state.
  ///
  List<Widget> _getContentWidgets(BuildContext context, AuthType authType) {
    List<Widget> screenWidgets = [
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
    ];

    Widget authCredentialsWidget = Expanded(
      flex: 2,
      child: Column(
        children: authType == AuthType.Login
            ? _getLoginWidgets(context)
            : _getRegistrationWidgets(context),
      ),
    );

    List<Widget> authControlWidgets = [
      Spacer(),
      RoundedRectangleButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(AttemptAuthEvent(authType));
        },
        buttonText: _getAuthenticationButtonText(authType),
        buttonColour: Colors.black,
        buttonTextColour: Colors.white,
      ),
    ];

    // Merge the children
    screenWidgets.add(authCredentialsWidget);
    screenWidgets.addAll(authControlWidgets);

    return screenWidgets;
  }

  /// Method to get login widgets.
  ///
  List<Widget> _getLoginWidgets(BuildContext context) {
    return [
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
        prefixIcon: Icon(Icons.mail),
        onChanged: (val) {
          BlocProvider.of<AuthBloc>(context).add(InfoEntryEvent(
            val,
            CredentialType.Email,
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
            CredentialType.Password,
          ));
        },
      ),
    ];
  }

  /// Method to get registration widgets.
  ///
  List<Widget> _getRegistrationWidgets(BuildContext context) {
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

  /// Method to get the authentication button text based on the
  /// current state, i.e. Login for login state and Register for
  /// register state.
  ///
  String _getAuthenticationButtonText(AuthType authType) {
    if (authType == AuthType.Login)
      return 'Login';
    else
      return 'Register';
  }
}
