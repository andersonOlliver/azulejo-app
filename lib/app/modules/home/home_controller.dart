import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'candidate_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CandidateStore _candidateStore;

  @observable
  Stream<List<Candidate>>? intervieweds;

  @observable
  Stream<List<Candidate>>? toInterview;

  HomeControllerBase(this._candidateStore) {
    getData();
  }

  @action
  getData() {
    intervieweds = _candidateStore.candidatesInterviewed;
    toInterview = _candidateStore.candidatesToInterview;
  }
}
