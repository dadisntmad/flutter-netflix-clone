import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/movie_list.dart';

class MovieClient {
  final _httpClient = http.Client();
  final _apiKey = dotenv.env['API_KEY'];
  static const _baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<Movie> fetchLatestReleasedMovie() async {
    final response = await _httpClient.get(
      Uri.parse('$_baseUrl/latest?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return Movie.fromJson(result);
    } else {
      throw Exception('Failed to fetch latest released movie.');
    }
  }

  Future<MovieList> fetchMovies(String type) async {
    final response = await _httpClient.get(
      Uri.parse('$_baseUrl/$type?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return MovieList.fromJson(result);
    } else {
      throw Exception('Failed to fetch movies.');
    }
  }

  Future<MovieList> searchMovie(String searchQuery, int page) async {
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$searchQuery&page=$page';

    final response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return MovieList.fromJson(result);
    } else {
      throw Exception('Failed to search movies.');
    }
  }
}
