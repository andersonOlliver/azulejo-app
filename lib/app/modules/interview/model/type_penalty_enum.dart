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
