import 'package:azulejo/app/modules/login/login_Page.dart';
import 'package:azulejo/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [$LoginController];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
