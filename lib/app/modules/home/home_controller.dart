import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/home/repository/candidate_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CandidateRepository _candidateRepository;

  @observable
  List<Candidate>? toInterview;

  HomeControllerBase(this._candidateRepository) {
    this.getCandidates();
  }

  @action
  Future<void> getCandidates() async {
    toInterview = await this._candidateRepository.listBy(false);
  }
}
