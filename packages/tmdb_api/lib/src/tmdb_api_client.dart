import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// TODO: Add code to protect against an empty query ("")

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
    @required String tmdbAPIKey,
  })  : assert(tmdbAPIKey != null),
        _httpClient = httpClient ?? http.Client(),
        _tmdbAPIKey = tmdbAPIKey;

  static const _authority = "api.themoviedb.org";

  final String _tmdbAPIKey;
  final http.Client _httpClient;

  /// Returns a Movie Response object containing a list of movies from TMDB that match the given query
  Future<TMDBMovieResponse> searchMovies({
    String query,
    String language,
    int page,
    bool includeAdult,
    String region,
    int year,
    int primaryReleaseYear,
  }) async {
    final queryParams = <String, String>{};
    // returns 401 status code (unauthorised) if no API Key supplied.
    if (_tmdbAPIKey != null) {
      queryParams.addAll({'api_key': _tmdbAPIKey});
    }
    // defaults to "language=en-US".
    if (language != null) {
      queryParams.addAll({'language': language});
    }
    // If query is an empty string or null we get back a 422 status code. "Query must be provided". Minimum string length is 1.
    if (query != null) {
      queryParams.addAll({'query': query});
    }
    // defaults to "page=1". 20 results to a page.
    if (page != null) {
      queryParams.addAll({'page': page.toString()});
    }
    // defaults to "inculde_adult=false". Supply 'true' to show adult content in results.
    if (includeAdult != null) {
      queryParams.addAll({'include_adult': includeAdult.toString()});
    }
    // no default. Specify region to show region specific release dates.
    if (region != null) {
      queryParams.addAll({'region': region});
    }
    // no default. A filter to limit the results to a specific year (looking at all release dates).
    if (year != null) {
      queryParams.addAll({'year': year.toString()});
    }
    // no default. A filter to limit the results to a specific primary release year.
    if (primaryReleaseYear != null) {
      queryParams
          .addAll({'primary_release_year': primaryReleaseYear.toString()});
    }
    final uri = Uri.https(_authority, '/3/search/movie', queryParams);
    print(uri);
    return _fetchMovies(uri);
  }

  Future<TMDBMovieResponse> _fetchMovies(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    /// TODO: Add specific responses to handle other status codes
    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    dynamic body;

    try {
      body = json.decode(response.body);
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return TMDBMovieResponse.fromJson(body);
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  Future<TMDBTVResponse> searchTV({
    String query,
    String language,
    int page,
    bool includeAdult,
    int firstAirDate,
  }) async {
    final queryParams = <String, String>{};
    // returns 401 status code (unauthorised) if no API Key supplied.
    if (_tmdbAPIKey != null) {
      queryParams.addAll({'api_key': _tmdbAPIKey});
    }
    // defaults to "language=en-US".
    if (language != null) {
      queryParams.addAll({'language': language});
    }
    // If query is an empty string or null we get back a 422 status code. "Query must be provided". Minimum string length is 1.
    if (query != null) {
      queryParams.addAll({'query': query});
    }
    // defaults to "page=1". 20 results to a page.
    if (page != null) {
      queryParams.addAll({'page': page.toString()});
    }
    // defaults to "inculde_adult=false". Supply 'true' to show adult content in results.
    if (includeAdult != null) {
      queryParams.addAll({'include_adult': includeAdult.toString()});
    }
    // no default. Specify region to show region specific release dates.
    if (firstAirDate != null) {
      queryParams.addAll({'first_air_date': firstAirDate.toString()});
    }

    final uri = Uri.https(_authority, '/3/search/tv', queryParams);
    print(uri);
    return _fetchTV(uri);
  }

  Future<TMDBTVResponse> _fetchTV(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    /// TODO: Add specific responses to handle other status codes
    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    dynamic body;

    try {
      body = json.decode(response.body);
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return TMDBTVResponse.fromJson(body);
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
