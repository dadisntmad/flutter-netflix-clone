import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/get_image.dart';
import 'package:netflix_clone/view_models/search_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const _SearchBar(),
      ),
      body: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: model.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return _Movies(index: index);
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<SearchViewModel>();

    return TextField(
      onChanged: model.searchMovie,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          iconSize: 15,
          onPressed: () {},
          icon: const Icon(
            Icons.cancel,
          ),
        ),
        suffixIconColor: Colors.grey,
        suffixIconConstraints: BoxConstraints.tight(const Size.square(32)),
        hintText: 'Search',
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
      ),
    );
  }
}

class _Movies extends StatelessWidget {
  final int index;

  const _Movies({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<SearchViewModel>();
    final movie = model.movies[index];

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: NetworkImage(
                    getImage('${movie.backdropPath}'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                movie.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade300,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(Icons.play_circle_outline, size: 40),
          ],
        ),
      ),
    );
  }
}
