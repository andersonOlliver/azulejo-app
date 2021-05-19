import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/interview/components/iterview_timer/interview_timer_component.dart';
import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'interview_controller.dart';

class InterviewPage extends StatefulWidget {
  final Candidate candidate;
  const InterviewPage({Key? key, required this.candidate}) : super(key: key);
  @override
  InterviewPageState createState() => InterviewPageState();
}

class InterviewPageState
    extends ModularState<InterviewPage, InterviewController> {
  @override
  void initState() {
    controller.setCandidate(widget.candidate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _header(),
                        _penaltList(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      _penaltyButton(),
                      _finishButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              controller.candidate?.name ?? "Nome do candidato",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(
              height: 71,
            ),
            InterviewTimer()
          ],
        );
      }),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 37,
        right: 22,
        top: 53,
        bottom: 18,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
              0xff193283,
            ),
            Color(
              0xff142869,
            ),
          ],
        ),
      ),
    );
  }

  Widget _penaltList() {
    return Observer(builder: (_) {
      return StreamBuilder(
        stream: controller.penalties,
        builder: (context, AsyncSnapshot<List<Penalty>> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: Text('Nenhuma penalidade adicionada')),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var model = snapshot.data![index];
                return Dismissible(
                  key: Key(model.id),
                  onDismissed: (direction) {
                    controller.removePenalty(context, model);
                  },
                  child: ListTile(
                    title: Text(model.title),
                    subtitle: Text('Falta ${model.typeDescription}'),
                    trailing: Container(
                      child: Center(
                          child: Text(
                        '${model.typeValue}',
                        style: TextStyle(
                            color: model.typeValue! < 4
                                ? Colors.black
                                : Colors.white),
                      )),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: model.typeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      );
    });
  }

  Widget _finishButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.finishInterview,
          child: Text(
            "Finalizar",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _penaltyButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () => controller.addPenalty(context),
          child: Text('Adicionar penalidade'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Color(0xfff5f5f5)),
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Color(0xff000E55))),
          ),
        ),
      ),
    );
  }
}
