import 'package:butler_app/src/models/login_model.dart';
import 'package:butler_app/src/resources/services/auth_service.dart';

enum InfoType {
  Email,
  Password,
}

enum AuthType {
  Login,
  Register,
}

class AuthRepository {
  Auth _auth;

  AuthRepository() {
    _auth = Auth();
  }

  void login(LoginModel loginModel) async {
    await _auth.loginUserWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
  }

  void register(LoginModel loginModel) async {
    await _auth.registerUser(
      email: loginModel.email,
      password: loginModel.password,
    );
  }
}
