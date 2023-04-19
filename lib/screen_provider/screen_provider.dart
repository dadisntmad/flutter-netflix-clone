import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/loader_screen.dart';
import 'package:netflix_clone/screens/main_screen.dart';
import 'package:netflix_clone/view_models/auth_viewmodel.dart';
import 'package:netflix_clone/view_models/loader_viewmodel.dart';
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
    return const HomeScreen();
  }

  Widget loaderScreen() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderScreen(),
    );
  }
}
