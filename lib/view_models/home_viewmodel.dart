import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/models/movie.dart';

class HomeViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();

  Movie? _latestReleasedMovie;
  Movie? get latestReleasedMovie => _latestReleasedMovie;

  List<Movie> _nowPlayingMovies = [];
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  List<Movie> _popularMovies = [];
  List<Movie> get popularMovies => _popularMovies;

  List<Movie> _topRatedMovies = [];
  List<Movie> get topRatedMovies => _topRatedMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getData() async {
    _isLoading = true;

    _latestReleasedMovie = await _movieClient.fetchLatestReleasedMovie();

    final nowPlaying = await _movieClient.fetchMovies('now_playing');
    _nowPlayingMovies = nowPlaying.results;

    final popular = await _movieClient.fetchMovies('popular');
    _popularMovies = popular.results;

    final topRated = await _movieClient.fetchMovies('top_rated');
    _topRatedMovies = topRated.results;

    _isLoading = false;

    notifyListeners();
  }
}
