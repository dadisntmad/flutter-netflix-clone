import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/screens/loader_screen.dart';
import 'package:netflix_clone/utils/get_image.dart';
import 'package:netflix_clone/view_models/upcoming_viewmodel.dart';
import 'package:provider/provider.dart';

class UpcomingMovieScreen extends StatefulWidget {
  const UpcomingMovieScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingMovieScreen> createState() => _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends State<UpcomingMovieScreen> {
  @override
  void initState() {
    context.read<UpcomingViewModel>().getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<UpcomingViewModel>();

    return model.isLoading
        ? const LoaderScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('New & Hot'),
              titleTextStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/profile_image.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: const [
                      Text(
                        '🍿',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _Movie(index: index);
                    },
                    childCount: model.upcomingMovies.length,
                  ),
                ),
              ],
            ),
          );
  }
}

class _Movie extends StatelessWidget {
  final int index;

  const _Movie({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UpcomingViewModel>();
    final movie = model.upcomingMovies[index];

    final parsedDate = DateTime.parse(movie.releaseDate);
    final month = DateFormat('MMM').format(parsedDate);
    final day = DateFormat('d').format(parsedDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  getImage('${movie.backdropPath}'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                month.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
