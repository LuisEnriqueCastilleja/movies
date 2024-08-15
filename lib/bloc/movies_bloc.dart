import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/repositories/search_movie_repository.dart';

class SearchMoviesBloc extends Disposable {
  SearchMoviesRepository? _searchMoviesRepository;
  StreamController<ApiResponse<List<Movie>>>? _searchMoviesListController;

  StreamSink<ApiResponse<List<Movie>>> get searchMoviesListSink =>
      _searchMoviesListController!.sink;
  Stream<ApiResponse<List<Movie>>> get popularMoviesListStream =>
      _searchMoviesListController!.stream;

  SearchMoviesBloc() {
    _searchMoviesListController = StreamController<ApiResponse<List<Movie>>>();
    _searchMoviesRepository = Modular.get<SearchMoviesRepository>();
  }

  Future fetchSearchedMovies(String search) async {
    searchMoviesListSink.add(ApiResponse.loading('Fetching Movies.'));
    try {
      List<Movie>? searchMoviesList =
          await _searchMoviesRepository?.filterMovies(search);
      searchMoviesListSink.add(ApiResponse.completed(searchMoviesList));
    } catch (e) {
      searchMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _searchMoviesListController?.close();
  }
}
