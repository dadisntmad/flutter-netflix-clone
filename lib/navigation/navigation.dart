import 'package:flutter/material.dart';
import 'package:netflix_clone/screen_provider/screen_provider.dart';

abstract class NavigationRoute {
  static const loader = '/';
  static const main = '/main';
  static const auth = '/auth';
  static const profile = '/profile';
}

class Navigation {
  static final _screenProvider = ScreenProvider();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.loader: (_) => _screenProvider.loaderScreen(),
    NavigationRoute.main: (_) => _screenProvider.mainScreen(),
    NavigationRoute.auth: (_) => _screenProvider.authScreen(),
    NavigationRoute.profile: (_) => _screenProvider.profileScreen(),
  };
}
