import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'candidate_store.dart';
import 'home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  static List<Bind> export = [$CandidateRepository, $CandidateStore];
  @override
  final List<Bind> binds = [
    $HomeController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
