import 'package:mobx/mobx.dart';

part 'interview_store.g.dart';

class InterviewStore = _InterviewStoreBase with _$InterviewStore;
abstract class _InterviewStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}