import 'dart:async';

import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:azulejo/app/modules/interview/services/interview_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/repository/penalty_repository.dart';

part 'penalty_controller.g.dart';

@Injectable()
class PenaltyController = _PenaltyControllerBase with _$PenaltyController;

abstract class _PenaltyControllerBase with Store implements Disposable {
  final PenaltyRepository _penaltyRepository;
  final InterviewService _interviewService;
  Timer? _debounce;

  @observable
  List<Penalty> penalties = [];

  @observable
  TypePenalty? type;

  @observable
  int indexEdit = -1;

  @observable
  bool isEditing = false;

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
  Future<void> updatePenalty(String value, Penalty penalty) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      print('atualizando');
      var copy = penalty.copyWith(title: value);
      await this._penaltyRepository.update(copy);
      await this.getData();
    });

    // this.edit();
  }

  @action
  void addPenalty(Penalty penalty) {
    print(penalty);
    this._interviewService.addPenalty(penalty);
    print('sadf');
    Modular.to.pop();
  }

  @action
  void edit() {
    this.isEditing = !this.isEditing;
    this.indexEdit = -1;
  }

  @action
  Future<void> delete(Penalty penalty) async {
    await this._penaltyRepository.delete(penalty);
    await this.getData();
    this.indexEdit = -1;
  }

  @action
  void setEditItem(int index) {
    this.indexEdit = index;
  }

  @override
  void dispose() {
    _debounce?.cancel();
  }
}
