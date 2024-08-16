import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/repositories/trending_movies_repository.dart';

class TrendingMoviesBloc extends Disposable {
  TrendingMoviesRepository? _trendingMoviesRepository;
  StreamController<ApiResponse<List<Movie>>>? _trendingMoviesListController;

  StreamSink<ApiResponse<List<Movie>>> get trendingMoviesListSink =>
      _trendingMoviesListController!.sink;
  Stream<ApiResponse<List<Movie>>> get trendingMoviesListStream =>
      _trendingMoviesListController!.stream;

  TrendingMoviesBloc() {
    _trendingMoviesListController =
        StreamController<ApiResponse<List<Movie>>>();
    _trendingMoviesRepository = Modular.get<TrendingMoviesRepository>();
  }

  Future fetchTrendingMovies() async {
    trendingMoviesListSink
        .add(ApiResponse.loading('Fetching Trending Movies.'));
    try {
      List<Movie>? trendingMoviesList =
          await _trendingMoviesRepository?.getTrendingMoviesList();
      trendingMoviesListSink.add(ApiResponse.completed(trendingMoviesList));
    } catch (e) {
      trendingMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _trendingMoviesListController?.close();
  }
}
