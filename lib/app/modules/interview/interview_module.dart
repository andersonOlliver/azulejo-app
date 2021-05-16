import 'package:azulejo/app/modules/interview/components/iterview_timer/interview_timer_controller.dart';
import 'package:azulejo/app/modules/interview/page/penalty/penalty_controller.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';
import 'package:azulejo/app/modules/interview/services/interview_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'page/interview/interview_page.dart';
import 'page/interview/interview_controller.dart';
import 'page/penalty/penalty_page.dart';

class InterviewModule extends Module {
  @override
  final List<Bind> binds = [
    $InterviewController,
    $PenaltyController,
    $InterviewTimerController,
    $PenaltyRepository,
    $InterviewService
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => InterviewPage(candidate: args.data),
    ),
    ChildRoute(
      '/penalty',
      child: (_, args) => PenaltyPage(typePenalty: args.data),
    ),
  ];
}
