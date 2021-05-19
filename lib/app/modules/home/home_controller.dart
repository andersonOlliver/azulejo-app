import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  // final CandidateRepository _candidateRepository;

  // @observable
  // List<Candidate>? toInterview;

  // @observable
  // ValueListenable<Box<Candidate>>? candidates;

  // @observable
  // List<Candidate>? interviewed;

  // HomeControllerBase(this._candidateRepository) {
  //   this.getCandidates();
  //   this.getEntrevistados();
  // }

  // @action
  // Future<void> getCandidates() async {
  //   toInterview = await this._candidateRepository.listBy(false);
  //   candidates = await _candidateRepository.list();
  // }

  // @action
  // Future<void> getEntrevistados() async {
  //   interviewed = await this._candidateRepository.listBy(true);
  // }
}
