import 'package:azulejo/app/modules/interview/interview_Page.dart';
import 'package:azulejo/app/modules/interview/interview_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InterviewModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InterviewStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InterviewPage()),
  ];
}
