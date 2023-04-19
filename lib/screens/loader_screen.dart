import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';

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
