import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    $HomeController,
    $CandidateRepository,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
