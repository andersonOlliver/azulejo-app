import 'package:azulejo/app/modules/interview/components/iterview_timer/interview_timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InterviewTimer extends StatefulWidget {
  @override
  _InterviewTimerState createState() => _InterviewTimerState();
}

class _InterviewTimerState
    extends ModularState<InterviewTimer, InterviewTimerController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.timer,
            color: Colors.white70,
            size: 16,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            controller.formatedTimer,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
            ),
            textAlign: TextAlign.right,
          ),
        ],
      );
    });
  }
}
