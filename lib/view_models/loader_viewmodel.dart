import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/services/auth_service.dart';

class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkForAuthenticatedUser();
  }

  Future<void> checkForAuthenticatedUser() async {
    final isAuthenticated = await _authService.isAuthenticated();

    final currentScreen =
        isAuthenticated ? NavigationRoute.home : NavigationRoute.auth;

    Navigator.of(context).pushReplacementNamed(currentScreen);
  }
}
