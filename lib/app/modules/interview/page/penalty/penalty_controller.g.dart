// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PenaltyController = BindInject(
  (i) => PenaltyController(i<PenaltyRepository>(), i<InterviewService>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PenaltyController on _PenaltyControllerBase, Store {
  final _$penaltiesAtom = Atom(name: '_PenaltyControllerBase.penalties');

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

  final _$typeAtom = Atom(name: '_PenaltyControllerBase.type');

  @override
  TypePenalty? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(TypePenalty? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$indexEditAtom = Atom(name: '_PenaltyControllerBase.indexEdit');

  @override
  int get indexEdit {
    _$indexEditAtom.reportRead();
    return super.indexEdit;
  }

  @override
  set indexEdit(int value) {
    _$indexEditAtom.reportWrite(value, super.indexEdit, () {
      super.indexEdit = value;
    });
  }

  final _$isEditingAtom = Atom(name: '_PenaltyControllerBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_PenaltyControllerBase.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$updatePenaltyAsyncAction =
      AsyncAction('_PenaltyControllerBase.updatePenalty');

  @override
  Future<void> updatePenalty(String value, Penalty penalty) {
    return _$updatePenaltyAsyncAction
        .run(() => super.updatePenalty(value, penalty));
  }

  final _$deleteAsyncAction = AsyncAction('_PenaltyControllerBase.delete');

  @override
  Future<void> delete(Penalty penalty) {
    return _$deleteAsyncAction.run(() => super.delete(penalty));
  }

  final _$_PenaltyControllerBaseActionController =
      ActionController(name: '_PenaltyControllerBase');

  @override
  void setType(TypePenalty type) {
    final _$actionInfo = _$_PenaltyControllerBaseActionController.startAction(
        name: '_PenaltyControllerBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$_PenaltyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPenalty(Penalty penalty) {
    final _$actionInfo = _$_PenaltyControllerBaseActionController.startAction(
        name: '_PenaltyControllerBase.addPenalty');
    try {
      return super.addPenalty(penalty);
    } finally {
      _$_PenaltyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit() {
    final _$actionInfo = _$_PenaltyControllerBaseActionController.startAction(
        name: '_PenaltyControllerBase.edit');
    try {
      return super.edit();
    } finally {
      _$_PenaltyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditItem(int index) {
    final _$actionInfo = _$_PenaltyControllerBaseActionController.startAction(
        name: '_PenaltyControllerBase.setEditItem');
    try {
      return super.setEditItem(index);
    } finally {
      _$_PenaltyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
penalties: ${penalties},
type: ${type},
indexEdit: ${indexEdit},
isEditing: ${isEditing}
    ''';
  }
}
