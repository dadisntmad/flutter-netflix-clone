import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: accentRed),
      ),
    );
  }
}
