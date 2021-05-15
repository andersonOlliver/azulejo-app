import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';

part 'penalty_store.g.dart';

@Injectable()
class PenaltyStore = _PenaltyStoreBase with _$PenaltyStore;

abstract class _PenaltyStoreBase with Store {
  final PenaltyRepository _repository;
  @observable
  List<Penalty> penalties = [];

  _PenaltyStoreBase(this._repository) {
    this.getData();
  }

  @action
  void getData() {
    penalties = [
      Penalty(title: 'Cruzou os braços', type: TypePenalty.LOW),
      Penalty(title: 'Bocejou', type: TypePenalty.LOW),
      Penalty(title: 'Não se vestiu adequadamente', type: TypePenalty.LOW),
    ];
  }
}
