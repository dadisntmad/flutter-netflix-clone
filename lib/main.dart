import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryBackground,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: primaryBackground,
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
