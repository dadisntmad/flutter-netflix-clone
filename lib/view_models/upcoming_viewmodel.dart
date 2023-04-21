import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/models/movie.dart';

class UpcomingViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();

  List<Movie> _upcomingMovies = [];
  List<Movie> get upcomingMovies => _upcomingMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUpcomingMovies() async {
    _isLoading = true;

    final response = await _movieClient.fetchUpcomingMovies();
    _upcomingMovies = response.results;

    _isLoading = false;

    notifyListeners();
  }
}
