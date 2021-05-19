import 'package:mobx/mobx.dart';

part 'signature_store.g.dart';

class SignatureStore = _SignatureStoreBase with _$SignatureStore;
abstract class _SignatureStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}