import 'package:azulejo/app/core/database/box_name.dart';
import 'package:azulejo/app/modules/home/widgtes/to_interview_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_controller.dart';
import 'model/candidate_model.dart';
import 'widgtes/interview_list_widget.dart';

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
          ToInterviewList(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Entrevistados'),
                Divider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [_interviewedList()],
                // ),
                // _interviewedList(),
                InterviewList(),
              ],
            ),
          ),
          Container()
        ],
      ),
    ));
  }

  // Widget _toInterviewList() => Observer(
  //       builder: (context) {
  //         if (controller.toInterview == null) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else {
  //           return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: controller.toInterview!.length,
  //             itemBuilder: (context, index) {
  //               var model = controller.toInterview![index];
  //               return ListTile(
  //                 title: Text(model.name),
  //                 subtitle: Text('Sem assinatura'),
  //                 onTap: () {
  //                   Modular.to.pushNamed('/interview', arguments: model);
  //                 },
  //               );
  //             },
  //           );
  //         }
  //       },
  //     );

  // Widget _interviewedList() => Observer(
  //       builder: (context) {
  //         if (controller.interviewed == null) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else {
  //           return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: controller.interviewed!.length,
  //             itemBuilder: (context, index) {
  //               var model = controller.interviewed![index];
  //               return ListTile(
  //                 title: Text(model.name),
  //                 trailing: Icon(
  //                   Icons.circle,
  //                   // color: ,
  //                   // if(color: Ty,)
  //                 ),
  //               );
  //             },
  //           );
  //         }
  //       },
  //     );
}
