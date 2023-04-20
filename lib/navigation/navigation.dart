import 'package:flutter/material.dart';
import 'package:netflix_clone/screen_provider/screen_provider.dart';

abstract class NavigationRoute {
  static const loader = '/';
  static const main = '/main';
  static const home = '/home';
  static const upcoming = '/upcoming';
  static const auth = '/auth';
}

class Navigation {
  static final _screenProvider = ScreenProvider();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.loader: (_) => _screenProvider.loaderScreen(),
    NavigationRoute.main: (_) => _screenProvider.mainScreen(),
    NavigationRoute.home: (_) => _screenProvider.homeScreen(),
    NavigationRoute.upcoming: (_) => _screenProvider.upcomingMovieScreen(),
    NavigationRoute.auth: (_) => _screenProvider.authScreen(),
  };
}
