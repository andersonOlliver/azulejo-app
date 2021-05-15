import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';

part 'penalty_model.g.dart';

@HiveType(typeId: 1)
class Penalty extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final TypePenalty type;

  Penalty({
    String? id,
    required this.title,
    required this.type,
  }) {
    this.id = id ?? Uuid().v4();
  }

  Penalty copyWithPenalty(Penalty penalty) {
    return this.copyWith(
      id: penalty.id,
      title: penalty.title,
      type: penalty.type,
    );
  }

  Penalty copyWith({
    String? id,
    String? title,
    TypePenalty? type,
  }) {
    return Penalty(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
    };
  }

  factory Penalty.fromMap(Map<String, dynamic> map) {
    return Penalty(
      id: map['id'],
      title: map['title'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Penalty.fromJson(String source) =>
      Penalty.fromMap(json.decode(source));

  @override
  String toString() => 'Penalty(id: $id, title: $title, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Penalty &&
        other.id == id &&
        other.title == title &&
        other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ type.hashCode;
}
