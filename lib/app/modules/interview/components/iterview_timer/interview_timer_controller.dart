import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'interview_timer_controller.g.dart';

@Injectable()
class InterviewTimerController = _InterviewTimerControllerBase
    with _$InterviewTimerController;

abstract class _InterviewTimerControllerBase with Store implements Disposable {
  @observable
  String formatedTimer = '00:00:00';

  Timer? _timer;

  _InterviewTimerControllerBase() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => incrementTimer(),
    );
  }

  @observable
  DateTime currentTimer = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    0,
    0,
    0,
  );

  @action
  incrementTimer() {
    currentTimer = currentTimer.add(Duration(seconds: 1));
    this.formatedTimer = DateFormat('HH:mm:ss').format(currentTimer);
  }

  @override
  void dispose() {
    _timer?.cancel();
  }
}
