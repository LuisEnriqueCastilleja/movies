import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/repositories/coming_soon_movies_repository.dart';

class ComingSoonMoviesBloc extends Disposable {
  ComingSoonMoviesRepository? _comingSoonMoviesRepository;
  StreamController<ApiResponse<List<Movie>>>? _comingSoonMoviesListController;

  StreamSink<ApiResponse<List<Movie>>> get comingSoonMoviesListSink =>
      _comingSoonMoviesListController!.sink;
  Stream<ApiResponse<List<Movie>>> get comingSoonMoviesListStream =>
      _comingSoonMoviesListController!.stream;

  ComingSoonMoviesBloc() {
    _comingSoonMoviesListController =
        StreamController<ApiResponse<List<Movie>>>();
    _comingSoonMoviesRepository = Modular.get<ComingSoonMoviesRepository>();
  }

  Future fetchComingSoonMovies() async {
    comingSoonMoviesListSink
        .add(ApiResponse.loading('Fetching Coming Soon Movies.'));
    try {
      List<Movie>? comingSoonMoviesList =
          await _comingSoonMoviesRepository?.getComingSoonMoviesList();
      comingSoonMoviesListSink.add(ApiResponse.completed(comingSoonMoviesList));
    } catch (e) {
      comingSoonMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _comingSoonMoviesListController?.close();
  }
}
