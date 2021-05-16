// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CandidateAdapter extends TypeAdapter<Candidate> {
  @override
  final int typeId = 0;

  @override
  Candidate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Candidate(
      name: fields[1] as String,
      hasInterviewed: fields[3] as bool,
      signature: fields[2] as String?,
      id: fields[0] as String?,
      penalties: (fields[4] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, Candidate obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.signature)
      ..writeByte(3)
      ..write(obj.hasInterviewed)
      ..writeByte(4)
      ..write(obj.penalties);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CandidateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
