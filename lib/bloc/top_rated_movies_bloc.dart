import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/repositories/top_rated_movies_repository.dart';

class TopRatedMoviesBloc extends Disposable {
  TopRatedMoviesRepository? _topRatedMoviesRepository;
  StreamController<ApiResponse<List<Movie>>>? _topRatedMoviesListController;

  StreamSink<ApiResponse<List<Movie>>> get topRatedMoviesListSink =>
      _topRatedMoviesListController!.sink;
  Stream<ApiResponse<List<Movie>>> get topRatedMoviesListStream =>
      _topRatedMoviesListController!.stream;

  TopRatedMoviesBloc() {
    _topRatedMoviesListController =
        StreamController<ApiResponse<List<Movie>>>();
    _topRatedMoviesRepository = Modular.get<TopRatedMoviesRepository>();
  }

  Future fetchTopRatedMovies() async {
    topRatedMoviesListSink
        .add(ApiResponse.loading('Fetching Top Rated Movies.'));
    try {
      List<Movie>? topRatedMoviesList =
          await _topRatedMoviesRepository?.getTopRatedMoviesList();
      topRatedMoviesListSink.add(ApiResponse.completed(topRatedMoviesList));
    } catch (e) {
      topRatedMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _topRatedMoviesListController?.close();
  }
}
