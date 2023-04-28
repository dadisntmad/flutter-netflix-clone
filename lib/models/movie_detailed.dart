import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/models/credits.dart';
import 'package:netflix_clone/models/genres.dart';
import 'package:netflix_clone/models/videos.dart';

part 'movie_detailed.g.dart';

@JsonSerializable()
class MovieDetailed {
  final int id;
  final List<Genres> genres;
  final String title;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final Videos videos;
  final Credits credits;

  MovieDetailed({
    required this.id,
    required this.genres,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.videos,
    required this.credits,
  });

  factory MovieDetailed.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailedFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailedToJson(this);
}
