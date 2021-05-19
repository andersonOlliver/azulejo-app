import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'model/candidate_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 45, bottom: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF193283), Color(0xFF142869)],
              ),
            ),
            child: Center(
              child: Text(
                'Candidatos',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          _toInterview(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Entrevistados'),
                Divider(),
                _intervieweds(),
              ],
            ),
          ),
          Container()
        ],
      ),
    ));
  }

  Observer _intervieweds() {
    return Observer(builder: (_) {
      return StreamBuilder(
        stream: controller.intervieweds,
        builder: (context, AsyncSnapshot<List<Candidate>> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: Text('Nenhum candidato encontrado')),
            );
          } else {
            var sum = snapshot.data!
                .map((e) => e.penalties
                    ?.toList()
                    .map((p) => p.typeValue)
                    .reduce((value, element) => value! + element!))
                .toList();
            print(sum);
            print(snapshot.data!);
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var model = snapshot.data![index];
                return ListTile(
                  title: Text(model.name),
                  trailing: Icon(
                    Icons.circle,
                    color: getColorByValue(sum[index] ?? 0),
                  ),
                );
              },
            );
          }
        },
      );
    });
  }

  Observer _toInterview() {
    return Observer(builder: (_) {
      return StreamBuilder(
        stream: controller.toInterview,
        builder: (context, AsyncSnapshot<List<Candidate>> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: Text('Nenhum candidato encontrado')),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var model = snapshot.data![index];
                return ListTile(
                  title: Text(model.name),
                  subtitle:
                      !model.hasSignature ? Text('Sem assinatura') : Text(''),
                  trailing: !model.hasSignature ? Icon(Icons.edit_off) : null,
                  onTap: () {
                    var route =
                        model.hasSignature ? '/interview' : '/signature';
                    Modular.to.pushNamed(route, arguments: model);
                  },
                );
              },
            );
          }
        },
      );
    });
  }
}
