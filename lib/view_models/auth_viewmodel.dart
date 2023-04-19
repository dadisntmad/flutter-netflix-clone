import 'package:flutter/material.dart';
import 'package:netflix_clone/api/auth_client.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/services/auth_service.dart';
import 'package:netflix_clone/utils/validator.dart';

class AuthViewModel extends ChangeNotifier {
  final _authClient = AuthClient();
  final _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isValid(String username, String password) =>
      username.isNotEmpty || password.isNotEmpty;

  Future<String?> _onCatchError(String username, String password) async {
    try {
      await _authService.login(username, password);
    } on ExceptionType catch (e) {
      switch (e.type) {
        case ErrorTypes.networkError:
          return _errorMessage = 'Please check your Internet connection.';
        case ErrorTypes.loginError:
          return _errorMessage = 'Invalid username or password.';
        case ErrorTypes.otherError:
          return _errorMessage = 'Please try again later.';
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    if (!_isValid(username, password)) {
      _errorMessage = 'Please fill in the required fields.';
      return;
    }
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    _updateState(null, true);

    _errorMessage = await _onCatchError(username, password);

    if (_errorMessage == null) {
      Navigator.of(context).pushReplacementNamed(NavigationRoute.home);
    } else {
      _updateState(errorMessage, false);
    }
  }

  void _updateState(String? errorMessage, bool isLoading) {
    if (_errorMessage == errorMessage && _isLoading == isLoading) {
      return;
    }
    _errorMessage = errorMessage;
    _isLoading = isLoading;
    notifyListeners();
  }
}
