// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignatureController = BindInject(
  (i) => SignatureController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignatureController on _SignatureControllerBase, Store {
  final _$candidateAtom = Atom(name: '_SignatureControllerBase.candidate');

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

  final _$addSignatureAsyncAction =
      AsyncAction('_SignatureControllerBase.addSignature');

  @override
  Future<void> addSignature() {
    return _$addSignatureAsyncAction.run(() => super.addSignature());
  }

  final _$_SignatureControllerBaseActionController =
      ActionController(name: '_SignatureControllerBase');

  @override
  void setCandidate(Candidate candidate) {
    final _$actionInfo = _$_SignatureControllerBaseActionController.startAction(
        name: '_SignatureControllerBase.setCandidate');
    try {
      return super.setCandidate(candidate);
    } finally {
      _$_SignatureControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
candidate: ${candidate}
    ''';
  }
}
