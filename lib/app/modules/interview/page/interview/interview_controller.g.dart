// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InterviewController = BindInject(
  (i) => InterviewController(i<InterviewService>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InterviewController on _InterviewControllerBase, Store {
  final _$penaltiesAtom = Atom(name: '_InterviewControllerBase.penalties');

  @override
  Stream<List<Penalty>>? get penalties {
    _$penaltiesAtom.reportRead();
    return super.penalties;
  }

  @override
  set penalties(Stream<List<Penalty>>? value) {
    _$penaltiesAtom.reportWrite(value, super.penalties, () {
      super.penalties = value;
    });
  }

  final _$candidateAtom = Atom(name: '_InterviewControllerBase.candidate');

  @override
  Candidate? get candidate {
    _$candidateAtom.reportRead();
    return super.candidate;
  }

  @override
  set candidate(Candidate? value) {
    _$candidateAtom.reportWrite(value, super.candidate, () {
      super.candidate = value;
    });
  }

  final _$finishInterviewAsyncAction =
      AsyncAction('_InterviewControllerBase.finishInterview');

  @override
  Future<void> finishInterview() {
    return _$finishInterviewAsyncAction.run(() => super.finishInterview());
  }

  final _$_InterviewControllerBaseActionController =
      ActionController(name: '_InterviewControllerBase');

  @override
  void addPenalty(BuildContext context) {
    final _$actionInfo = _$_InterviewControllerBaseActionController.startAction(
        name: '_InterviewControllerBase.addPenalty');
    try {
      return super.addPenalty(context);
    } finally {
      _$_InterviewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCandidate(Candidate candidate) {
    final _$actionInfo = _$_InterviewControllerBaseActionController.startAction(
        name: '_InterviewControllerBase.setCandidate');
    try {
      return super.setCandidate(candidate);
    } finally {
      _$_InterviewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
penalties: ${penalties},
candidate: ${candidate}
    ''';
  }
}
