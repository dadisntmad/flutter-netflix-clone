import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _SearchBar(),
      ),
      body: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return const _Movies();
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
  const _Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://ntvb.tmsimg.com/assets/p16962226_v_h10_af.jpg?w=960&h=540',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Murder Mystery',
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
