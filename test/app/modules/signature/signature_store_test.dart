import 'package:flutter_test/flutter_test.dart';
import 'package:azulejo/app/modules/signature/signature_store.dart';
 
void main() {
  late SignatureStore store;

  setUpAll(() {
    store = SignatureStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}