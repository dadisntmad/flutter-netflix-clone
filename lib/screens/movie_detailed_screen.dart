import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';

class MovieDetailedScreen extends StatelessWidget {
  const MovieDetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                const _Trailer(),
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
              itemCount: 10,
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

class _Trailer extends StatelessWidget {
  const _Trailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey,
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
    const castTextStyle = TextStyle(color: Colors.grey);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Movie Name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Text(
                '2023',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Genre 1 • Genre 2 • Genre 3 ',
                  style: TextStyle(
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
          const Text(
            'After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cast: Actor 1, Actor 2, Actor 3, Actor 4, Actor 5',
            style: castTextStyle,
          ),
          const SizedBox(height: 4),
          const Text('Creator: Creator Name', style: castTextStyle),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          _RateButton(
            onPressed: () {},
            icon: Icons.add,
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
    return InkWell(
      onTap: () {
        print('movie id: $index');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://rts.org.uk/sites/default/files/styles/9_column_landscape/public/sex_ed.png?itok=05UwrF_b'),
                    ),
                  ),
                ),
                const Text('Movie Name'),
              ],
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
