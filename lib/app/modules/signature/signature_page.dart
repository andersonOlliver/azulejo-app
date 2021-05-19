import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:azulejo/app/modules/signature/signature_store.dart';
import 'package:flutter/material.dart';

class SignaturePage extends StatefulWidget {
  final String title;
  const SignaturePage({Key? key, this.title = 'Insira sua Assinatura'})
      : super(key: key);
  @override
  SignaturePageState createState() => SignaturePageState();
}

class SignaturePageState extends State<SignaturePage> {
  final SignatureStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.undo_outlined),
              tooltip: 'Desfazer'),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
            tooltip: 'Confirmar',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Divider(
              height: 5,
              color: Colors.black87,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Nome Candidato".toUpperCase(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
