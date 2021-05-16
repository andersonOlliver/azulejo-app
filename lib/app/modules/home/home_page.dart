import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

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
          _toInterviewList(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Entrevistados'),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('João Pedro Paulo'), Icon(Icons.circle)],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _toInterviewList() => Observer(
        builder: (context) {
          if (controller.toInterview == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.toInterview!.length,
              itemBuilder: (context, index) {
                var model = controller.toInterview![index];
                return ListTile(
                  title: Text(model.name),
                  subtitle: Text('Sem assinatura'),
                  onTap: () {
                    Modular.to.pushNamed('/interview', arguments: model);
                  },
                );
              },
            );
          }
        },
      );
}
