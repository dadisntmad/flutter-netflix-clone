import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/screens/screens.dart';
import 'package:netflix_clone/utils/get_image.dart';
import 'package:netflix_clone/utils/parse_date.dart';
import 'package:netflix_clone/view_models/viewmodels.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailedScreen extends StatefulWidget {
  const MovieDetailedScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  @override
  void initState() {
    context.read<MovieDetailedViewModel>().getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieDetailedViewModel>();
    final similar = model.similarMovies;

    final trailerKey = model.movie?.videos.results
        .firstWhere(
            (video) => video.type == 'Trailer' && video.site == 'YouTube')
        .key;

    return model.isLoading
        ? const LoaderScreen()
        : Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      _Trailer(trailerKey: trailerKey!),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _ActionButton(
                              icon: Icons.cast,
                              onTap: () {},
                            ),
                            const SizedBox(width: 10),
                            _ActionButton(
                              icon: Icons.close,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const _Description(),
                  const _RateActions(),
                  const SizedBox(height: 14),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'More Like This',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: similar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _SimilarMovies(index: index);
                    },
                  ),
                ],
              ),
            ),
          );
  }
}

class _Trailer extends StatefulWidget {
  final String trailerKey;

  const _Trailer({Key? key, required this.trailerKey}) : super(key: key);

  @override
  State<_Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<_Trailer> {
  late final YoutubePlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = YoutubePlayerController(
      initialVideoId: widget.trailerKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _videoController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: accentRed,
      progressColors: const ProgressBarColors(
        playedColor: accentRed,
        handleColor: accentRed,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black87,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const _Button({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailedViewModel>();
    final movie = model.movie;

    final List<String> genres = [];
    for (var genre in movie!.genres) {
      genres.add(genre.name);
    }

    final List<String> actors = [];
    for (var actor in movie.credits.cast) {
      actors.add(actor.name);
    }

    final List<String> directors = [];
    for (var director in movie.credits.crew) {
      if (director.department == 'Directing') {
        directors.add(director.name);
      }
    }

    const castTextStyle = TextStyle(color: Colors.grey);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${movie?.title}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                parseDate(movie.releaseDate, 'y'),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  genres.join(' • '),
                  style: const TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _Button(
            onPressed: () {},
            icon: Icons.play_arrow,
            title: 'Play',
            backgroundColor: Colors.white,
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          _Button(
            onPressed: () {},
            icon: Icons.download,
            title: 'Download',
            backgroundColor: accentGrey,
          ),
          const SizedBox(height: 14),
          Text(
            movie.overview,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            'Cast: ${actors.join(', ')}',
            style: castTextStyle,
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'more',
            trimExpandedText: ' less',
            moreStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            lessStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          ReadMoreText(
            'Director: ${directors.join(', ')}',
            style: castTextStyle,
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'more',
            trimExpandedText: ' less',
            moreStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            lessStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _RateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  const _RateButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(icon)),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _RateActions extends StatelessWidget {
  const _RateActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailedViewModel>();
    final isFavorite =
        context.select((MovieDetailedViewModel model) => model.isFavorite);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          _RateButton(
            onPressed: () {
              model.addToFavorites();
            },
            icon: isFavorite ? Icons.done : Icons.add,
            title: 'My List',
          ),
          const SizedBox(width: 14),
          _RateButton(
            onPressed: () {},
            icon: Icons.thumb_up_alt_outlined,
            title: 'Rate',
          ),
          const SizedBox(width: 14),
          _RateButton(
            onPressed: () {},
            icon: Icons.share,
            title: 'Share',
          ),
        ],
      ),
    );
  }
}

class _SimilarMovies extends StatelessWidget {
  final int index;

  const _SimilarMovies({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailedViewModel>();
    final movie = model.similarMovies[index];

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          NavigationRoute.movieDetailed,
          arguments: movie.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  movie.backdropPath != null
                      ? Container(
                          width: 150,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                getImage('${movie.backdropPath}'),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 145,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: accentGrey,
                          ),
                        ),
                  Expanded(
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.download,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
