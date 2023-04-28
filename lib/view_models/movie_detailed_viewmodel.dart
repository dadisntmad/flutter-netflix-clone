import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/movie_detailed.dart';

class MovieDetailedViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();

  final int id;

  MovieDetailedViewModel({required this.id});

  MovieDetailed? _movie;
  MovieDetailed? get movie => _movie;

  List<Movie> _similarMovies = [];
  List<Movie> get similarMovies => _similarMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getDetails() async {
    _isLoading = true;

    _movie = await _movieClient.fetchDetailedMovie(id);

    final response = await _movieClient.fetchSimilarMovies(id);
    _similarMovies = response.results;

    _isLoading = false;

    notifyListeners();
  }
}
