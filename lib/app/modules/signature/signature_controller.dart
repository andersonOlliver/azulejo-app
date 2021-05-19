import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signature_controller.g.dart';

@Injectable()
class SignatureController = _SignatureControllerBase with _$SignatureController;

abstract class _SignatureControllerBase with Store {
  @observable
  Candidate? candidate;

  @action
  void setCandidate(Candidate candidate) {
    this.candidate = candidate;
  }

  @action
  Future<void> addSignature() async {
    this.candidate = candidate!.copyWith(signature: 'assinatura fake');
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Modular.to.popAndPushNamed('/interview', arguments: this.candidate);
  }
}
