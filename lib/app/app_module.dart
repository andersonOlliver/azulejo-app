import 'package:azulejo/app/core/splash_screen_page.dart';
import 'package:azulejo/app/modules/login/login_module.dart';
import 'package:azulejo/app/modules/signature/signature_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/interview/interview_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...HomeModule.export,
    ...InterviewModule.exports,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/interview', module: InterviewModule()),
    ModuleRoute('/signature', module: SignatureModule()),
  ];
}
