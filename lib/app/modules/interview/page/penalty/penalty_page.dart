import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:azulejo/app/modules/interview/page/penalty/penalty_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PenaltyPage extends StatefulWidget {
  final TypePenalty typePenalty;
  const PenaltyPage({required this.typePenalty});
  @override
  PenaltyPageState createState() => PenaltyPageState();
}

class PenaltyPageState extends ModularState<PenaltyPage, PenaltyController> {
  @override
  void initState() {
    controller.setType(widget.typePenalty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Penalidade ${typePenaltyDescription[widget.typePenalty]!}'),
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
          itemBuilder: (context, index) {
            var model = controller.penalties[index];
            return ListTile(
              title: Text(model.title),
              leading: Radio<Penalty>(
                value: controller.penalties[index],
                groupValue: controller.penalties[0],
                onChanged: (penalty) => controller.addPenalty(model),
              ),
              onTap: () => controller.addPenalty(model),
            );
          },
        ),
      ),
    );
  }
}
