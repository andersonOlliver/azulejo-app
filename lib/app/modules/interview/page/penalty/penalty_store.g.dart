// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PenaltyStore = BindInject(
  (i) => PenaltyStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PenaltyStore on _PenaltyStoreBase, Store {
  final _$penaltiesAtom = Atom(name: '_PenaltyStoreBase.penalties');

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

  final _$_PenaltyStoreBaseActionController =
      ActionController(name: '_PenaltyStoreBase');

  @override
  void getData() {
    final _$actionInfo = _$_PenaltyStoreBaseActionController.startAction(
        name: '_PenaltyStoreBase.getData');
    try {
      return super.getData();
    } finally {
      _$_PenaltyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
penalties: ${penalties}
    ''';
  }
}
