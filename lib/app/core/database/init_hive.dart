import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CandidateAdapter());
  Hive.registerAdapter(PenaltyAdapter());
  Hive.registerAdapter(TypePenaltyAdapter());
}
