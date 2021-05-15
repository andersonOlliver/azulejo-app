// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_penalty_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypePenaltyAdapter extends TypeAdapter<TypePenalty> {
  @override
  final int typeId = 2;

  @override
  TypePenalty read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypePenalty.LOW;
      case 1:
        return TypePenalty.MEDIUM;
      case 2:
        return TypePenalty.HIGH;
      case 3:
        return TypePenalty.ELIMINATORY;
      default:
        return TypePenalty.LOW;
    }
  }

  @override
  void write(BinaryWriter writer, TypePenalty obj) {
    switch (obj) {
      case TypePenalty.LOW:
        writer.writeByte(0);
        break;
      case TypePenalty.MEDIUM:
        writer.writeByte(1);
        break;
      case TypePenalty.HIGH:
        writer.writeByte(2);
        break;
      case TypePenalty.ELIMINATORY:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypePenaltyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
