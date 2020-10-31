// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_tv_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBTVOverview _$TMDBTVOverviewFromJson(Map<String, dynamic> json) {
  return TMDBTVOverview(
    voteCount: json['vote_count'] as int,
    id: json['id'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    name: json['name'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    originalLanguage: json['original_language'] as String,
    originalName: json['original_name'] as String,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    backdropPath: json['backdrop_path'] as String,
    overview: json['overview'] as String,
    firstAirDate: json['first_air_date'] as String,
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
  );
}
