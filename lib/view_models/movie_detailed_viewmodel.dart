import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/api/user_client.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/movie_detailed.dart';
import 'package:netflix_clone/services/user_data_service.dart';

class MovieDetailedViewModel extends ChangeNotifier {
  final _movieClient = MovieClient();
  final _userClient = UserClient();
  final _userDataService = UserDataService();

  final int id;

  MovieDetailedViewModel({required this.id});

  MovieDetailed? _movie;
  MovieDetailed? get movie => _movie;

  List<Movie> _similarMovies = [];
  List<Movie> get similarMovies => _similarMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  Future<void> getDetails() async {
    _isLoading = true;

    final sessionId = await _userDataService.getSessionId();

    _movie = await _movieClient.fetchDetailedMovie(id);

    final response = await _movieClient.fetchSimilarMovies(id);
    _similarMovies = response.results;

    if (sessionId != null) {
      _isFavorite = await _movieClient.isFavorite(
        movieId: id,
        sessionId: sessionId,
      );
    }
    _isLoading = false;

    notifyListeners();
  }

  Future<void> addToFavorites() async {
    final sessionId = await _userDataService.getSessionId();
    final accountId = await _userDataService.getAccountId();

    notifyListeners();

    _isFavorite = !_isFavorite;

    await _userClient.markMovieAsFavorite(
      movieId: id,
      isFavorite: _isFavorite,
      accountId: accountId!,
      sessionId: sessionId!,
    );
  }
}
