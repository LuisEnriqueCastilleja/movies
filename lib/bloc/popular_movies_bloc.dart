import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/popular_movies/popular_movies_model.dart';
import 'package:movies/repositories/popular_movies_respository.dart';

class PopularMoviesBloc extends Disposable {
  PopularMoviesRepository? _popularMoviesRepository;
  StreamController<ApiResponse<List<PopularMovies>>>?
      _popularMoviesListController;

  StreamSink<ApiResponse<List<PopularMovies>>> get popularMoviesListSink =>
      _popularMoviesListController!.sink;
  Stream<ApiResponse<List<PopularMovies>>> get popularMoviesListStream =>
      _popularMoviesListController!.stream;

  PopularMoviesBloc() {
    _popularMoviesListController =
        StreamController<ApiResponse<List<PopularMovies>>>();
    _popularMoviesRepository = Modular.get<PopularMoviesRepository>();
  }

  Future fetchPopularMovies() async {
    popularMoviesListSink.add(ApiResponse.loading('Fetching Popular Movies.'));
    try {
      List<PopularMovies>? popularMoviesList =
          await _popularMoviesRepository?.getPopularMoviesList();
      popularMoviesListSink.add(ApiResponse.completed(popularMoviesList));
    } catch (e) {
      popularMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _popularMoviesListController?.close();
  }
}
