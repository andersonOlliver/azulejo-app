// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_timer_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InterviewTimerController = BindInject(
  (i) => InterviewTimerController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InterviewTimerController on _InterviewTimerControllerBase, Store {
  final _$formatedTimerAtom =
      Atom(name: '_InterviewTimerControllerBase.formatedTimer');

  @override
  String get formatedTimer {
    _$formatedTimerAtom.reportRead();
    return super.formatedTimer;
  }

  @override
  set formatedTimer(String value) {
    _$formatedTimerAtom.reportWrite(value, super.formatedTimer, () {
      super.formatedTimer = value;
    });
  }

  final _$currentTimerAtom =
      Atom(name: '_InterviewTimerControllerBase.currentTimer');

  @override
  DateTime get currentTimer {
    _$currentTimerAtom.reportRead();
    return super.currentTimer;
  }

  @override
  set currentTimer(DateTime value) {
    _$currentTimerAtom.reportWrite(value, super.currentTimer, () {
      super.currentTimer = value;
    });
  }

  final _$_InterviewTimerControllerBaseActionController =
      ActionController(name: '_InterviewTimerControllerBase');

  @override
  dynamic incrementTimer() {
    final _$actionInfo = _$_InterviewTimerControllerBaseActionController
        .startAction(name: '_InterviewTimerControllerBase.incrementTimer');
    try {
      return super.incrementTimer();
    } finally {
      _$_InterviewTimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formatedTimer: ${formatedTimer},
currentTimer: ${currentTimer}
    ''';
  }
}
