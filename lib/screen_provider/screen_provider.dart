import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/view_models/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class ScreenProvider {
  Widget authScreen() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthScreen(),
    );
  }

  Widget home() {
    return const HomeScreen();
  }
}
