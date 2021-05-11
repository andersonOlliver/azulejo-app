import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/page/penalty/penalty_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PenaltyPage extends StatefulWidget {
  final String title;
  const PenaltyPage({Key? key, this.title = 'Penalidades Leves'})
      : super(key: key);
  @override
  PenaltyPageState createState() => PenaltyPageState();
}

class PenaltyPageState extends ModularState<PenaltyPage, PenaltyStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.penalties.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.penalties[index].title),
            leading: Radio<Penalty>(
              value: controller.penalties[index],
              groupValue: controller.penalties[0],
              onChanged: (Penalty? value) {
                Modular.to.pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
