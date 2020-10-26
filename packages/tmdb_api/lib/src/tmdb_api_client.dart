import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown if an excepton occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown is an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template datamuse_api_client}
/// A Dart API Client for The Movie Database REST API.
/// Learn more at https://www.themoviedb.org/documentation/api
/// {@endtemplate}
class TMDBApiClient {
  /// {@macro tmdb_api_client}
  TMDBApiClient({
    http.Client httpClient,
    String tmdbAPIKey,
  })  : assert(tmdbAPIKey != null),
        _httpClient = httpClient ?? http.Client(),
        _tmdbAPIKey = tmdbAPIKey;

  static const _authority = "api.themoviedb.org";

  final String _tmdbAPIKey;
  final http.Client _httpClient;

  /// Returns a list of movies from TMDB that match the given query
  Future<List<TMDBMovieOverview>> searchMovies({
    String query,
  }) async {
    final queryParams = <String, String>{};
    if (_tmdbAPIKey != null) {
      queryParams.addAll({'api_key': _tmdbAPIKey});
    }
    queryParams.addAll({'language': 'en_US'});
    if (query != null) {
      queryParams.addAll({'query': query});
    }
    queryParams.addAll({'page': '1'});
    queryParams.addAll({'include_adult': 'false'});

    final uri = Uri.https(_authority, '/3/search/movie', queryParams);
    print(uri);
    return _fetchMovies(uri);
  }

  Future<List<TMDBMovieOverview>> _fetchMovies(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw HttpRequestFailure(response.statusCode);
    }

    List body;

    try {
      body = json.decode(response.body) as List;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return body
          .map((dynamic item) =>
              TMDBMovieOverview.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
