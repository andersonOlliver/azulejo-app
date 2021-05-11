// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InterviewStore = BindInject(
  (i) => InterviewStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InterviewStore on _InterviewStoreBase, Store {
  final _$penaltiesAtom = Atom(name: '_InterviewStoreBase.penalties');

  @override
  List<Penalty> get penalties {
    _$penaltiesAtom.reportRead();
    return super.penalties;
  }

  @override
  set penalties(List<Penalty> value) {
    _$penaltiesAtom.reportWrite(value, super.penalties, () {
      super.penalties = value;
    });
  }

  final _$_InterviewStoreBaseActionController =
      ActionController(name: '_InterviewStoreBase');

  @override
  void addPenalty() {
    final _$actionInfo = _$_InterviewStoreBaseActionController.startAction(
        name: '_InterviewStoreBase.addPenalty');
    try {
      return super.addPenalty();
    } finally {
      _$_InterviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
penalties: ${penalties}
    ''';
  }
}
