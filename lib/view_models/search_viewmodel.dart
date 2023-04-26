import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/models/movie.dart';

class SearchViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();

  final List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _searchQuery = '';

  Timer? _debounce;

  int _currentPage = 0;
  int _totalPages = 1;

  Future<void> _resetMoviesPerSearch() async {
    _currentPage = 0;
    _totalPages = 1;
    _movies.clear();
    await _getMovies();
  }

  Future<void> _getMovies() async {
    if (_isLoading || _currentPage >= _totalPages) return;

    _isLoading = true;

    final page = _currentPage += 1;

    final response = await _movieClient.searchMovie(_searchQuery, page);

    _movies.addAll(response.results);
    _currentPage = response.page;
    _totalPages = response.totalPages;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> searchMovie(String query) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final searchQuery = query.isNotEmpty ? query : '';
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetMoviesPerSearch();
    });
  }

  void loadNextPage(int index) {
    if (index < _movies.length - 1) return;
    _getMovies();
  }
}
