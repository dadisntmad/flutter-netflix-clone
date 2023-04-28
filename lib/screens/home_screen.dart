import 'package:flutter/material.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/screens/loader_screen.dart';
import 'package:netflix_clone/utils/get_image.dart';
import 'package:netflix_clone/view_models/viewmodels.dart';
import 'package:netflix_clone/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeViewModel>().getData();
    context.read<UserViewModel>().getAccountDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeViewModel>();
    final username = context.read<UserViewModel>().user?.username;

    return model.isLoading
        ? const LoaderScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text('For $username'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NavigationRoute.search);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NavigationRoute.profile);
                  },
                  icon: Image.asset(
                    'assets/profile_image.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                const _MovieCard(),
                const SizedBox(height: 24),
                MovieList(
                  title: 'Now Playing',
                  content: model.nowPlayingMovies,
                ),
                MovieList(
                  title: 'Popular',
                  content: model.popularMovies,
                ),
                MovieList(
                  title: 'Top Rated',
                  content: model.topRatedMovies,
                ),
              ],
            ),
          );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewModel>().latestReleasedMovie;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 350.0,
          height: 450.0,
          decoration: model?.posterPath != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      getImage('${model?.posterPath}'),
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                )
              : null,
          child: Center(
            child: Text(
              '${model?.title}'.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  NavigationRoute.movieDetailed,
                  arguments: model!.id,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 36,
                    ),
                    Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF342E2E),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 36,
                    ),
                    Text(
                      'My List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
