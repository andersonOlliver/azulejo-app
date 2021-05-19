import 'dart:async';
import 'dart:collection';

import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'interview_service.g.dart';

@Injectable()
class InterviewService {
  final CandidateRepository _candidateRepository;
  final PenaltyRepository _penaltyRepository;
  final _streamController = StreamController<List<Penalty>>();
  Stream<List<Penalty>> get penalties => _streamController.stream;

  Candidate? candidate;

  List<Penalty> _penalties = [];

  InterviewService(this._candidateRepository, this._penaltyRepository) {
    init();
  }

  @action
  init() {
    candidate = Candidate.empty();
    _penalties.clear();
  }

  @action
  addCandidate(Candidate candidate) {
    this.candidate = candidate;
  }

  @action
  addPenalty(Penalty penalty) {
    this._penalties.add(penalty);
    this._streamController.add(this._penalties);
  }

  finalize() async {
    this.candidate!.penalties = HiveList(
      await this._penaltyRepository.getBox(),
    );
    this.candidate!.penalties!.addAll(this._penalties);
    var copy = this.candidate!.copyWith(hasInterviewed: true);
    await this._candidateRepository.update(copy);

    this.init();
  }
}
