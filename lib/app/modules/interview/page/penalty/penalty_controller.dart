import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:azulejo/app/modules/interview/services/interview_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';

part 'penalty_controller.g.dart';

@Injectable()
class PenaltyController = _PenaltyControllerBase with _$PenaltyController;

abstract class _PenaltyControllerBase with Store {
  final PenaltyRepository _penaltyRepository;
  final InterviewService _interviewService;
  @observable
  List<Penalty> penalties = [];

  @observable
  TypePenalty? type;

  _PenaltyControllerBase(this._penaltyRepository, this._interviewService);

  @action
  void setType(TypePenalty type) {
    this.type = type;
    getData();
  }

  @action
  Future<void> getData() async {
    penalties = await _penaltyRepository.listBy(type!);
  }

  @action
  void addPenalty(Penalty penalty) {
    print(penalty);
    this._interviewService.addPenalty(penalty);
    print('sadf');
    Modular.to.pop();
  }
}
