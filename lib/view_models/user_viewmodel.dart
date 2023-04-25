import 'package:flutter/material.dart';
import 'package:netflix_clone/api/user_client.dart';
import 'package:netflix_clone/models/user.dart';
import 'package:netflix_clone/services/auth_service.dart';
import 'package:netflix_clone/services/user_data_service.dart';

class UserViewModel extends ChangeNotifier {
  final _userClient = UserClient();
  final _userDataService = UserDataService();
  final _authService = AuthService();

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getAccountDetails() async {
    _isLoading = true;

    final sessionId = await _userDataService.getSessionId();

    final response = await _userClient.fetchAccountDetails(sessionId!);

    _user = response;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.logout();
  }
}
