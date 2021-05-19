import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/interview/components/select_penalty_type.dart';
import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/services/interview_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'interview_controller.g.dart';

@Injectable()
class InterviewController = _InterviewControllerBase with _$InterviewController;

abstract class _InterviewControllerBase with Store {
  final InterviewService interviewService;

  @observable
  Stream<List<Penalty>>? penalties;

  @observable
  Candidate? candidate;

  @observable
  bool isFinish = false;

  _InterviewControllerBase(this.interviewService) {
    penalties = this.interviewService.penalties;
    candidate = this.interviewService.candidate;
  }

  @action
  void addPenalty(BuildContext context) {
    print('Adicionar penalidade');
    Modal().mainBottomSheet(
      context,
      onSelectPenalty: (value) {
        Modular.to.pushNamed('penalty', arguments: value);
        print(value);
      },
    );
  }

  @action
  void setCandidate(Candidate candidate) {
    this.candidate = candidate;
    this.interviewService.addCandidate(candidate);
  }

  @action
  Future<void> finishInterview() async {
    await this.interviewService.finalize();
    isFinish = true;
    Modular.to.pop();
  }
}
