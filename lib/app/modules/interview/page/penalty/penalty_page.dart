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
          Observer(
            builder: (context) =>
                controller.isEditing ? _saveButton() : _editButton(),
          )
        ],
      ),
      body: Observer(
          builder: (context) =>
              controller.isEditing ? _editPenalties() : _listPenalties()
          // ListView.builder(
          //   itemCount: controller.penalties.length,
          //   itemBuilder: (context, index) {
          //     var model = controller.penalties[index];
          //     if (controller.isEditing) {
          //       return ListTile(
          //         title: TextFormField(
          //           initialValue: model.title,
          //           onFieldSubmitted: (value) {},
          //         ),
          //       );
          //     }
          //     return ListTile(
          //       title: Text(model.title),
          //       // leading: Icon(Icons.check_circle_outline_sharp),
          //       leading: Radio<Penalty>(
          //         value: controller.penalties[index],
          //         groupValue: null,
          //         onChanged: (penalty) => controller.addPenalty(model),
          //       ),
          //       onTap: () => controller.addPenalty(model),
          //     );
          //   },
          // ),
          ),
    );
  }

  ListView _editPenalties() {
    return ListView.builder(
      itemCount: controller.penalties.length,
      itemBuilder: (context, index) {
        var model = controller.penalties[index];
        return ListTile(
          title: Observer(builder: (_) {
            if (index == controller.indexEdit) {
              return TextFormField(
                initialValue: model.title,
                onChanged: (value) {
                  controller.updatePenalty(value, model);
                },
              );
            }
            return InkWell(
              child: Text(model.title),
              onTap: () => controller.setEditItem(index),
            );
          }),
          // leading: Icon(Icons.check_circle_outline_sharp),
          trailing: IconButton(
            icon: Icon(Icons.close_rounded),
            onPressed: () => controller.delete(model),
          ),
        );
      },
    );
  }

  ListView _listPenalties() {
    return ListView.builder(
        itemCount: controller.penalties.length,
        itemBuilder: (context, index) {
          var model = controller.penalties[index];
          return ListTile(
            title: Text(model.title),
            // leading: Icon(Icons.check_circle_outline_sharp),
            leading: Radio<Penalty>(
              value: controller.penalties[index],
              groupValue: null,
              onChanged: (penalty) => controller.addPenalty(model),
            ),
            onTap: () => controller.addPenalty(model),
          );
        });
  }

  Widget _editButton() {
    return IconButton(
      onPressed: controller.edit,
      icon: Icon(Icons.edit),
    );
  }

  Widget _saveButton() {
    return IconButton(
      onPressed: controller.edit,
      icon: Icon(Icons.check),
    );
  }
}
