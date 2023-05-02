import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie_list.dart';
import 'package:netflix_clone/models/user.dart';

class UserClient {
  final _httpClient = http.Client();
  final _apiKey = dotenv.env['API_KEY'];
  static const _baseUrl = 'https://api.themoviedb.org/3/account';

  Future<User> fetchAccountDetails(String sessionId) async {
    final response = await _httpClient.get(
      Uri.parse('$_baseUrl?api_key=$_apiKey&session_id=$sessionId'),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return User.fromJson(result);
    } else {
      throw Exception('Failed to load account details.');
    }
  }

  Future<String> markMovieAsFavorite({
    required int movieId,
    required bool isFavorite,
    required int accountId,
    required String sessionId,
  }) async {
    final url =
        '$_baseUrl/$accountId/favorite?api_key=$_apiKey&session_id=$sessionId';

    final response = await _httpClient.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'media_type': 'movie',
          'media_id': movieId,
          'favorite': isFavorite,
        },
      ),
    );
    return response.body;
  }

  Future<MovieList> fetchFavoriteMovies({
    required int accountId,
    required String sessionId,
  }) async {
    final url =
        '$_baseUrl/account_id/favorite/movies?api_key=$_apiKey&session_id=$sessionId&sort_by=created_at.desc';

    final response = await _httpClient.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return MovieList.fromJson(result);
    } else {
      throw Exception('Failed to fetch favorite movies.');
    }
  }
}
