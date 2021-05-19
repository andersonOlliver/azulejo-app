import 'package:azulejo/app/modules/signature/signature_Page.dart';
import 'package:azulejo/app/modules/signature/signature_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignatureModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignatureStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignaturePage()),
  ];
}
