import 'package:azulejo/app/core/database/seed_candidate.dart';
import 'package:azulejo/app/core/database/seed_penalty.dart';

Future seed() async {
  return Future.wait([
    seedPenalties(),
    seedCandidates(),
  ]);
}
