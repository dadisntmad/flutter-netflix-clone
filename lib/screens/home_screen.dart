import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('For username'),
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
      body: ListView(
        children: const [
          _MovieCard(),
          SizedBox(height: 24),
          MovieList(
            title: 'Title 1',
            itemCount: 5,
          ),
          MovieList(
            title: 'Title 2',
            itemCount: 10,
          ),
          MovieList(
            title: 'Title 3',
            itemCount: 15,
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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 350.0,
          height: 450.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: const NetworkImage(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8j12tohv1NBZNmpU93f47sAKBbw.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Text(
              'movie name'.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
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
