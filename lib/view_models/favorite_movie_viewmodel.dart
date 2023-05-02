import 'package:flutter/material.dart';
import 'package:netflix_clone/api/movie_client.dart';
import 'package:netflix_clone/api/user_client.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/user_data_service.dart';

class FavoriteMovieViewModel extends ChangeNotifier {
  final _userClient = UserClient();
  final _userDataService = UserDataService();

  List<Movie> _favoriteMovies = [];
  List<Movie> get favoriteMovies => _favoriteMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getFavoriteMovies() async {
    _isLoading = true;

    final accountId = await _userDataService.getAccountId();
    final sessionId = await _userDataService.getSessionId();

    final response = await _userClient.fetchFavoriteMovies(
      accountId: accountId!,
      sessionId: sessionId!,
    );

    _favoriteMovies = response.results;

    _isLoading = false;

    notifyListeners();
  }
}
