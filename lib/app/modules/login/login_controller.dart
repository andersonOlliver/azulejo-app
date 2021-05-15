import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'login_email.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isClicked = false;

  @observable
  bool invalidCredentials = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  LoginEmail get credential => LoginEmail.fromEmailAndPassword(email, password);

  @action
  login() async {
    isClicked = true;
    if (credential.isValid) {
      await Future.delayed(Duration(seconds: 1));
      Modular.to.pushReplacementNamed('/home');
    }
  }

  @action
  invalidate() {
    this.invalidCredentials = true;
  }
}
