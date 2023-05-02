import 'package:flutter/material.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/screens/screens.dart';
import 'package:netflix_clone/utils/get_image.dart';
import 'package:netflix_clone/view_models/viewmodels.dart';
import 'package:provider/provider.dart';

class FavoriteMovieScreen extends StatefulWidget {
  const FavoriteMovieScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteMovieScreen> createState() => _FavoriteMovieScreenState();
}

class _FavoriteMovieScreenState extends State<FavoriteMovieScreen> {
  @override
  void initState() {
    context.read<FavoriteMovieViewModel>().getFavoriteMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FavoriteMovieViewModel>();

    return model.isLoading
        ? const LoaderScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Favorites'),
            ),
            body: SafeArea(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 300,
                ),
                itemCount: model.favoriteMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  return _MovieList(index: index);
                },
              ),
            ),
          );
  }
}

class _MovieList extends StatelessWidget {
  final int index;

  const _MovieList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<FavoriteMovieViewModel>();
    final movie = model.favoriteMovies[index];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          NavigationRoute.movieDetailed,
          arguments: movie.id,
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    getImage('${movie.posterPath}'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
