import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';
import 'package:hive/hive.dart';

import 'box_name.dart';

Future seedPenalties() async {
  Box<Penalty> penaltyBox = await Hive.openBox(PENALTY_NAME);
  if (penaltyBox.isEmpty) {
    await penaltyBox.addAll([
      ..._lowPenalties(),
      ..._mediumPenalties(),
      ..._highPenalties(),
      ..._eliminatoryPenalties(),
    ]);
  }
  penaltyBox.close();
}

List<Penalty> _lowPenalties() {
  return [
    Penalty(
      title: 'Cruzou os braços',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Bocejou',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Não se vestiu adequadamente',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Demonstrou-se desconfortável durante a entrevista',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Foi prolixo durante as respostas',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Foi monossilábico durante as respostas',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Falou mal do emprego anterior',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Expôs sua vida pessoal em excesso',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Apresentou dificuldade em articular suas respostas',
      type: TypePenalty.LOW,
    ),
    Penalty(
      title: 'Perguntou sobre salário no início da entrevista',
      type: TypePenalty.LOW,
    ),
  ];
}

List<Penalty> _mediumPenalties() {
  return [
    Penalty(
      title: 'Chegou até 15 minutos atrasado',
      type: TypePenalty.MEDIUM,
    ),
    Penalty(
      title: 'Não fez pergunta sobre a vaga ao entrevistador',
      type: TypePenalty.MEDIUM,
    ),
    Penalty(
      title: 'Não trouxe currículo impresso',
      type: TypePenalty.MEDIUM,
    ),
    Penalty(
      title: 'Não tem conhecimento da língua espanhola',
      type: TypePenalty.MEDIUM,
    ),
    Penalty(
      title: 'Estava desinformado sobre a vaga',
      type: TypePenalty.MEDIUM,
    ),
    Penalty(
      title: 'Estava desinformado sobre a empresa',
      type: TypePenalty.MEDIUM,
    ),
  ];
}

List<Penalty> _highPenalties() {
  return [
    Penalty(
      title: 'Chegou até 30 minutos atrasado',
      type: TypePenalty.HIGH,
    ),
    Penalty(
      title: 'Cometeu erro de concordância verbal na entrevista',
      type: TypePenalty.HIGH,
    ),
    Penalty(
      title: 'Não tem disponibilidade para viajar',
      type: TypePenalty.HIGH,
    ),
    Penalty(
      title: 'Respondeu erroneamente a uma pergunta técnica',
      type: TypePenalty.HIGH,
    ),
  ];
}

List<Penalty> _eliminatoryPenalties() {
  return [
    Penalty(
      title: 'Chegou mais do que 30 minutos atrasado',
      type: TypePenalty.ELIMINATORY,
    ),
    Penalty(
      title: 'Usou termo de baixo calão',
      type: TypePenalty.ELIMINATORY,
    ),
    Penalty(
      title: 'Não tem conhecimento da língua inglesa',
      type: TypePenalty.ELIMINATORY,
    ),
    Penalty(
      title: 'Saiu da entrevista antes do seu término.',
      type: TypePenalty.ELIMINATORY,
    ),
  ];
}
