import 'package:flutter/material.dart';
import 'package:netflix_clone/screen_provider/screen_provider.dart';

abstract class NavigationRoute {
  static const loader = '/';
  static const home = '/home';
  static const auth = '/auth';
}

class Navigation {
  static final _screenProvider = ScreenProvider();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.loader: (_) => _screenProvider.loaderScreen(),
    NavigationRoute.home: (_) => _screenProvider.homeScreen(),
    NavigationRoute.auth: (_) => _screenProvider.authScreen(),
  };
}
