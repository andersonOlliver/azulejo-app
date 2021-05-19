import 'dart:async';

import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'candidate_store.g.dart';

@Injectable()
class CandidateStore = _CandidateStoreBase with _$CandidateStore;

abstract class _CandidateStoreBase with Store {
  final CandidateRepository _candidateRepository;
  final PenaltyRepository _penaltyRepository;

  final _streamInterviewedController = StreamController<List<Candidate>>();
  final _streamToInterviewController = StreamController<List<Candidate>>();

  Stream<List<Candidate>> get candidatesToInterview =>
      _streamToInterviewController.stream;
  Stream<List<Candidate>> get candidatesInterviewed =>
      _streamInterviewedController.stream;

  _CandidateStoreBase(this._candidateRepository, this._penaltyRepository) {
    init();
  }

  @action
  init() async {
    var candidates = await this._candidateRepository.listAll();
    _streamToInterviewController.add(
      candidates.where((element) => !element.hasInterviewed).toList(),
    );
    _streamInterviewedController.add(
      candidates.where((element) => element.hasInterviewed).toList(),
    );
  }
}
