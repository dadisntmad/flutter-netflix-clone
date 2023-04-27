import 'package:flutter/material.dart';
import 'package:netflix_clone/screen_provider/screen_provider.dart';

abstract class NavigationRoute {
  static const loader = '/';
  static const main = '/main';
  static const auth = '/auth';
  static const profile = '/profile';
  static const search = '/search';
  static const movieDetailed = '/detailed';
}

class Navigation {
  static final _screenProvider = ScreenProvider();

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoute.loader: (_) => _screenProvider.loaderScreen(),
    NavigationRoute.main: (_) => _screenProvider.mainScreen(),
    NavigationRoute.auth: (_) => _screenProvider.authScreen(),
    NavigationRoute.profile: (_) => _screenProvider.profileScreen(),
    NavigationRoute.search: (_) => _screenProvider.searchScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoute.movieDetailed:
        final id = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => _screenProvider.detailedScreen(id),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Text('Undefined route'));
    }
  }
}
