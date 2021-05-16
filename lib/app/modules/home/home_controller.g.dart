// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<CandidateRepository>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$toInterviewAtom = Atom(name: 'HomeControllerBase.toInterview');

  @override
  List<Candidate>? get toInterview {
    _$toInterviewAtom.reportRead();
    return super.toInterview;
  }

  @override
  set toInterview(List<Candidate>? value) {
    _$toInterviewAtom.reportWrite(value, super.toInterview, () {
      super.toInterview = value;
    });
  }

  final _$getCandidatesAsyncAction =
      AsyncAction('HomeControllerBase.getCandidates');

  @override
  Future<void> getCandidates() {
    return _$getCandidatesAsyncAction.run(() => super.getCandidates());
  }

  @override
  String toString() {
    return '''
toInterview: ${toInterview}
    ''';
  }
}
