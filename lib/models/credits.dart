import 'package:json_annotation/json_annotation.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits {
  final List<Cast> cast;
  final List<Crew> crew;

  Credits({required this.cast, required this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}

@JsonSerializable()
class Cast {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  Cast({required this.id, required this.name, required this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String department;
  final String job;

  Crew({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.department,
    required this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
