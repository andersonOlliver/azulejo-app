import 'package:flutter_test/flutter_test.dart';
import 'package:azulejo/app/modules/interview/interview_store.dart';
 
void main() {
  late InterviewStore store;

  setUpAll(() {
    store = InterviewStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}