import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/screens.dart';
import 'package:netflix_clone/view_models/viewmodels.dart';
import 'package:provider/provider.dart';

class ScreenProvider {
  Widget mainScreen() {
    return const MainScreen();
  }

  Widget authScreen() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthScreen(),
    );
  }

  Widget homeScreen() {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeScreen(),
    );
  }

  Widget upcomingMovieScreen() {
    return ChangeNotifierProvider(
      create: (_) => UpcomingViewModel(),
      child: const UpcomingMovieScreen(),
    );
  }

  Widget loaderScreen() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderScreen(),
    );
  }

  Widget profileScreen() {
    return const ProfileScreen();
  }

  Widget searchScreen() {
    return ChangeNotifierProvider(
      create: (_) => SearchViewModel(),
      child: const SearchScreen(),
    );
  }

  Widget detailedScreen(int id) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailedViewModel(id: id),
      child: const MovieDetailedScreen(),
    );
  }

  Widget favoriteMovieScreen() {
    return ChangeNotifierProvider(
      create: (_) => FavoriteMovieViewModel(),
      child: const FavoriteMovieScreen(),
    );
  }
}
