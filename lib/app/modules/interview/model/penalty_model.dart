import 'dart:convert';

import 'package:azulejo/app/modules/interview/model/type_penalty_enum.dart';

class Penalty {
  final String title;
  final TypePenalty type;

  Penalty({
    required this.title,
    required this.type,
  });

  Penalty copyWith({
    String? title,
    TypePenalty? type,
  }) {
    return Penalty(
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
    };
  }

  factory Penalty.fromMap(Map<String, dynamic> map) {
    return Penalty(
      title: map['title'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Penalty.fromJson(String source) =>
      Penalty.fromMap(json.decode(source));

  @override
  String toString() => 'Penalty(title: $title, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Penalty && other.title == title && other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ type.hashCode;
}
