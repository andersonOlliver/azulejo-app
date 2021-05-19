import 'package:azulejo/app/core/database/box_name.dart';
import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InterviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _openBox(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ValueListenableBuilder(
            valueListenable: Hive.box<Candidate>(CANDIDATE_NAME).listenable(),
            builder: (context, Box<Candidate> box, _) {
              if (box.isEmpty) {
                return Center(
                  child: Text('Nenhum Candidato'),
                );
              } else {
                var candidates = box.values
                    .where((element) => element.hasInterviewed)
                    .toList();
                var sum = candidates
                    .map((e) => e.penalties
                        ?.toList()
                        .map((p) => p.typeValue)
                        .reduce((value, element) => value! + element!))
                    .toList();
                //     .reduce((value, element) => value! + element!);
                // print('------------------$sum');
                // print(candidates);
                print(box.values);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {
                    var model = candidates[index];
                    // var penaltySum = model.penalties!
                    //     .toList()
                    //     .map((p) => p.typeValue)
                    //     .reduce((value, element) => value! + element!);
                    print('------------------${sum[index]}');
                    return ListTile(
                      title: Text(model.name),
                      trailing: Icon(
                        Icons.circle,
                        color: getColorByValue(sum[index]!),
                      ),
                      // onTap: () {
                      //   Modular.to.pushNamed('/interview', arguments: model);
                      // },
                    );
                  },
                );
              }
            },
          );
        });
  }

  Future<Box<Candidate>> _openBox() async {
    if (!Hive.isBoxOpen(PENALTY_NAME)) {
      await Hive.openLazyBox(PENALTY_NAME);
    }
    if (!Hive.isBoxOpen(CANDIDATE_NAME)) {
      return await Hive.openBox(CANDIDATE_NAME);
    }
    return Hive.box(CANDIDATE_NAME);
  }
}
