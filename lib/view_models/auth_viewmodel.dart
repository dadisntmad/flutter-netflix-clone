import 'package:flutter/material.dart';
import 'package:netflix_clone/api/auth_client.dart';
import 'package:netflix_clone/screens/home_screen.dart';

class AuthViewModel extends ChangeNotifier {
  final _authClient = AuthClient();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    _isLoading = true;

    await _authClient.signIn(username: username, password: password);

    _isLoading = false;

    Navigator.of(context).pushReplacement(HomeScreen.route());

    notifyListeners();
  }
}
