// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<CandidateStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$interviewedsAtom = Atom(name: 'HomeControllerBase.intervieweds');

  @override
  Stream<List<Candidate>>? get intervieweds {
    _$interviewedsAtom.reportRead();
    return super.intervieweds;
  }

  @override
  set intervieweds(Stream<List<Candidate>>? value) {
    _$interviewedsAtom.reportWrite(value, super.intervieweds, () {
      super.intervieweds = value;
    });
  }

  final _$toInterviewAtom = Atom(name: 'HomeControllerBase.toInterview');

  @override
  Stream<List<Candidate>>? get toInterview {
    _$toInterviewAtom.reportRead();
    return super.toInterview;
  }

  @override
  set toInterview(Stream<List<Candidate>>? value) {
    _$toInterviewAtom.reportWrite(value, super.toInterview, () {
      super.toInterview = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic getData() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.getData');
    try {
      return super.getData();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
intervieweds: ${intervieweds},
toInterview: ${toInterview}
    ''';
  }
}
