import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/navigation/navigation.dart';
import 'package:netflix_clone/utils/get_image.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> content;

  const MovieList({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: content.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              final movie = content[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    NavigationRoute.movieDetailed,
                    arguments: movie.id,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      getImage('${movie.posterPath}'),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
