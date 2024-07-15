import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movielisting/models/movie.dart';
import 'package:path_provider/path_provider.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isfetchLoading = false;
  bool _errorFetching = false;
  String? _errorfetchMessage;
  List<Movie> get movies => _movies;
  bool get isfetchLoading => _isfetchLoading;
  bool get errorFetching => _errorFetching;
  String? get errorfetchMessage => _errorfetchMessage;

  MoviesProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    print("started");
    _isfetchLoading = true;
    notifyListeners();
    print("starts");
    try {
      final response = await http.post(
        Uri.parse('https://hoblist.com/api/movieList'),
        body: {
          'category': 'movies',
          'language': 'kannada',
          'genre': 'all',
          'sort': 'voting'
        },
      );

      if (response.statusCode == 200) {
        print(response);
        List<dynamic> movieList = json.decode(response.body)['result'];
        print(movieList);
        _movies = movieList.map((json) => Movie.fromJson(json)).toList();
        _isfetchLoading = false;
        notifyListeners();
      } else {
        _errorFetching = true;
        _errorfetchMessage = 'Failed to load movies';
        notifyListeners();
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(" error co $e");
    }
  }
}
