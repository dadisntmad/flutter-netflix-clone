import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:netflix_clone/constants/custom_theme.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigation = Navigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routes: navigation.routes,
        initialRoute: NavigationRoute.loader,
      ),
    );
  }
}
