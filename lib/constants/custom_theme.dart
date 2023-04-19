import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primaryBackground,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryBackground,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryBackground,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 12),
    ),
  );
}
