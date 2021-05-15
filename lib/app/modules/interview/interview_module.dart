import 'package:azulejo/app/modules/interview/page/penalty/penalty_store.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'page/interview/interview_page.dart';
import 'page/interview/interview_store.dart';
import 'page/penalty/penalty_page.dart';

class InterviewModule extends Module {
  @override
  final List<Bind> binds = [
    $InterviewStore,
    $PenaltyStore,
    $PenaltyRepository,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InterviewPage()),
    ChildRoute('/penalty', child: (_, args) => PenaltyPage()),
  ];
}
