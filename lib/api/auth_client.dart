import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthClient {
  final _httpClient = http.Client();
  final _apiKey = dotenv.env['API_KEY'];
  static const _baseUrl = 'https://api.themoviedb.org/3/authentication';

  Future<String> _makeToken() async {
    final response = await _httpClient.get(
      Uri.parse('$_baseUrl/token/new?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body) as Map<String, dynamic>;
      final result = token['request_token'] as String;
      return result;
    } else {
      throw Exception('Failed making a token');
    }
  }

  Future<String> _validateUserWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/token/validate_with_login?api_key=$_apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': username,
          'password': password,
          'request_token': requestToken,
        },
      ),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body) as Map<String, dynamic>;
      final result = token['request_token'] as String;
      return result;
    } else {
      throw Exception('Failed to validate');
    }
  }

  Future<String> _onMakeSession({required String requestToken}) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/session/new?api_key=$_apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'request_token': requestToken,
        },
      ),
    );

    if (response.statusCode == 200) {
      final sessionId = jsonDecode(response.body) as Map<String, dynamic>;
      final result = sessionId['session_id'] as String;
      return result;
    } else {
      throw Exception('Failed to make session');
    }
  }

  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validationToken = await _validateUserWithLogin(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _onMakeSession(requestToken: validationToken);
    return sessionId;
  }
}
