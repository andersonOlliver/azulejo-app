import 'dart:ui';

import 'package:hive/hive.dart';

part 'type_penalty_enum.g.dart';

@HiveType(typeId: 2)
enum TypePenalty {
  @HiveField(0)
  LOW,

  @HiveField(1)
  MEDIUM,

  @HiveField(2)
  HIGH,

  @HiveField(3)
  ELIMINATORY
}

const typePenaltyDescription = {
  TypePenalty.LOW: 'Leve',
  TypePenalty.MEDIUM: 'Média',
  TypePenalty.HIGH: 'Grave',
  TypePenalty.ELIMINATORY: 'Eliminatória',
};

const typePenaltyValue = {
  TypePenalty.LOW: 1,
  TypePenalty.MEDIUM: 2,
  TypePenalty.HIGH: 3,
  TypePenalty.ELIMINATORY: 4,
};

const typePenaltyColor = {
  TypePenalty.LOW: Color(0xff219653),
  TypePenalty.MEDIUM: Color(0xffF2994A),
  TypePenalty.HIGH: Color(0xFFEB5757),
  TypePenalty.ELIMINATORY: Color(0xFF570808),
};

Color? getColorByValue(int value) {
  if (value < 0) return typePenaltyColor[TypePenalty.LOW];
  switch (value) {
    case 0:
    case 1:
      return typePenaltyColor[TypePenalty.LOW];
    case 2:
      return typePenaltyColor[TypePenalty.MEDIUM];
    case 3:
      return typePenaltyColor[TypePenalty.HIGH];
    default:
      return typePenaltyColor[TypePenalty.ELIMINATORY];
  }
}
