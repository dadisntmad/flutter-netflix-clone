import 'package:json_annotation/json_annotation.dart';

part 'videos.g.dart';

@JsonSerializable()
class Videos {
  final List<Results> results;

  Videos({required this.results});

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Results {
  final String key;
  final String site;
  final String type;

  Results({required this.key, required this.site, required this.type});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
