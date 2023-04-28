// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailed _$MovieDetailedFromJson(Map<String, dynamic> json) =>
    MovieDetailed(
      id: json['id'] as int,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      videos: Videos.fromJson(json['videos'] as Map<String, dynamic>),
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailedToJson(MovieDetailed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genres': instance.genres,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'videos': instance.videos,
      'credits': instance.credits,
    };
