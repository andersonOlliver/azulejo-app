import 'package:azulejo/app/modules/home/model/candidate_model.dart';
import 'package:hive/hive.dart';

import 'box_name.dart';

Future seedCandidates() async {
  Box<Candidate> candidateBox = await Hive.openBox(CANDIDATE_NAME);
  if (candidateBox.isEmpty) {
    await candidateBox.addAll([
      Candidate(name: 'Yusuke Uramesh', hasInterviewed: false),
      Candidate(name: 'Doppo Orochi', hasInterviewed: false),
      Candidate(name: 'Shun de Andrômeda', hasInterviewed: false),
      Candidate(name: 'Tristan Taylor', hasInterviewed: false),
      Candidate(name: 'Hitokiri Battousai', hasInterviewed: false),
      Candidate(name: 'Shinji Ikari', hasInterviewed: false),
      Candidate(name: 'Edward Newgate', hasInterviewed: false),
      Candidate(name: 'Edward um', hasInterviewed: false),
      Candidate(name: 'Edward dois', hasInterviewed: false),
    ]);
  }
  candidateBox.close();
}
