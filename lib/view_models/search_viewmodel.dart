import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/models/movie.dart';

class SearchViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _searchQuery;
  String? get searchQuery => _searchQuery;

  Timer? _debounce;

  Future<void> _getMovies() async {
    _isLoading = true;

    final response = await _movieClient.searchMovie(_searchQuery!);

    _movies = response.results;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> searchMovie(String query) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final searchQuery = query.isNotEmpty ? query : '';
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _getMovies();
    });
  }
}
