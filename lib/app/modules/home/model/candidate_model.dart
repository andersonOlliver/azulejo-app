import 'dart:convert';

import 'package:azulejo/app/modules/interview/model/penalty_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'candidate_model.g.dart';

@HiveType(typeId: 0)
class Candidate extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? signature;

  @HiveField(3)
  final bool hasInterviewed;

  @HiveField(4)
  HiveList<Penalty>? penalties;

  Candidate(
      {required this.name,
      required this.hasInterviewed,
      this.signature,
      String? id,
      this.penalties}) {
    this.id = id ?? Uuid().v4();
  }

  Candidate copyWith({
    String? name,
    String? signature,
    bool? hasInterviewed,
  }) {
    return Candidate(
      name: name ?? this.name,
      signature: signature ?? this.signature,
      hasInterviewed: hasInterviewed ?? this.hasInterviewed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'signature': signature,
      'hasInterviewed': hasInterviewed,
    };
  }

  factory Candidate.empty() => Candidate(name: '', hasInterviewed: false);

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      name: map['name'],
      signature: map['signature'],
      hasInterviewed: map['hasInterviewed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source));

  @override
  String toString() =>
      'Candidate(name: $name, signature: $signature, hasInterviewed: $hasInterviewed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Candidate &&
        other.name == name &&
        other.signature == signature &&
        other.hasInterviewed == hasInterviewed;
  }

  @override
  int get hashCode =>
      name.hashCode ^ signature.hashCode ^ hasInterviewed.hashCode;
}
