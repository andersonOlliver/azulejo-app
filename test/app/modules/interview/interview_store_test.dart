import 'package:azulejo/app/modules/interview/page/interview/interview_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InterviewStore store;

  setUpAll(() {
    store = InterviewStore();
  });

  test('increment', () async {
    expect(store.penalties, equals([0]));
    store.addPenalty();
    expect(store.penalties.length, equals(3));
  });
}
