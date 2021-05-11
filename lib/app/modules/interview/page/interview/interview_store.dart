import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'interview_store.g.dart';

@Injectable()
class InterviewStore = _InterviewStoreBase with _$InterviewStore;

abstract class _InterviewStoreBase with Store {
  @observable
  List<Penalty> penalties = [];

  @action
  void addPenalty() {
    print('Adicionar penalidade');
  }
}
