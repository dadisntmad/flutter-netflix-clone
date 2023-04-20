import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/models/movie.dart';

part 'movie_list.g.dart';

@JsonSerializable()
class MovieList {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MovieList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
