import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
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
}
