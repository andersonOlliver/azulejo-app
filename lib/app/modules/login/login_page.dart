import 'package:azulejo/app/core/util/theme_data.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:azulejo/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _formKey.currentState!.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Azulejo',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 48,
              ),
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _fieldEmail(),
                  _fieldPassword(),
                  _buttonSubmit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loginSubmit() {
    if (_formKey.currentState!.validate()) {
      controller.login();
    } else {
      controller.invalidate();
    }
  }

  Widget _fieldPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: TextFormField(
        focusNode: passwordFocusNode,
        onChanged: controller.setPassword,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Senha',
            hintText: 'Informe uma senha'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'A senha é obrigatória';
          }
          return null;
        },
        onFieldSubmitted: (value) => _loginSubmit(),
      ),
    );
  }

  Widget _fieldEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: controller.setEmail,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'E-mail',
            hintText: 'Informe o e-mail'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'E-mail é obrigatório';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          print(value);
          passwordFocusNode.requestFocus();
        },
      ),
    );
  }

  Widget _buttonSubmit() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      child: Observer(
        builder: (_) {
          return ElevatedButton(
            onPressed: _loginSubmit,
            child: controller.isClicked
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : controller.invalidCredentials
                    ? Text('Tentar novamente')
                    : Text('Entrar'),
          );
        },
      ),
    );
  }
}
