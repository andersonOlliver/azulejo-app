// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PenaltyAdapter extends TypeAdapter<Penalty> {
  @override
  final int typeId = 1;

  @override
  Penalty read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Penalty(
      id: fields[0] as String?,
      title: fields[1] as String,
      type: fields[2] as TypePenalty,
    );
  }

  @override
  void write(BinaryWriter writer, Penalty obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PenaltyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
