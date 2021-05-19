import 'package:azulejo/app/core/database/box_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:azulejo/app/modules/home/model/candidate_model.dart';

part 'candidate_repository.g.dart';

@Injectable(lazy: true, singleton: false)
class CandidateRepository {
  Box<Candidate>? _box;
  CandidateRepository() {}

  Future open() async {
    _box = await Hive.openBox<Candidate>(CANDIDATE_NAME);
  }

  Future<List<Candidate>> listBy(bool hasInterviewed) async {
    if (_box == null) {
      await open();
    }
    return _box!
        .listenable()
        .value
        .values
        .where((element) => element.hasInterviewed == hasInterviewed)
        .toList();
  }

  Future<ValueListenable<Box<Candidate>>> list() async {
    if (_box == null) {
      await open();
    }
    return _box!.listenable();
  }

  Future<Candidate> update(Candidate candidate) async {
    await open();
    var registered =
        _box!.values.where((element) => element.id == candidate.id).first;
    await _box!.put(registered.key, candidate);
    return candidate;
  }
}
