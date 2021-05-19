import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/signature/signature_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignaturePage extends StatefulWidget {
  final String title;
  final Candidate candidate;
  const SignaturePage(
      {Key? key,
      this.title = 'Insira sua Assinatura',
      required this.candidate});
  @override
  SignaturePageState createState() => SignaturePageState();
}

class SignaturePageState
    extends ModularState<SignaturePage, SignatureController> {
  @override
  void initState() {
    controller.setCandidate(widget.candidate);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.undo_outlined),
              tooltip: 'Desfazer'),
          IconButton(
            onPressed: controller.addSignature,
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
