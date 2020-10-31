// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_tv_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBTVResponse _$TMDBTVResponseFromJson(Map<String, dynamic> json) {
  return TMDBTVResponse(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : TMDBTVOverview.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['errors'] as List)?.map((e) => e as String)?.toList(),
  );
}
