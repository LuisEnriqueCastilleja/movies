import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/repositories/movies_tv_people_repository.dart';

class MoviesTvPeopleBloc extends Disposable {
  MoviesTvPeopleRepository? _moviesTvPeopleRepository;
  StreamController<ApiResponse<List<Trending>>>? _movieTvPeopleListController;

  StreamSink<ApiResponse<List<Trending>>> get movieTvPeopleListSink =>
      _movieTvPeopleListController!.sink;
  Stream<ApiResponse<List<Trending>>> get movieTvPeopleListStream =>
      _movieTvPeopleListController!.stream;

  MoviesTvPeopleBloc() {
    _movieTvPeopleListController =
        StreamController<ApiResponse<List<Trending>>>();
    _moviesTvPeopleRepository = Modular.get<MoviesTvPeopleRepository>();
  }

  Future fetchMoviesTvPeopleList() async {
    movieTvPeopleListSink
        .add(ApiResponse.loading('Fetching Movies, TV Shows, People.'));
    try {
      List<Trending>? trendingList =
          await _moviesTvPeopleRepository?.getMoviesTvPeopleList();
      movieTvPeopleListSink.add(ApiResponse.completed(trendingList));
    } catch (e) {
      movieTvPeopleListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _movieTvPeopleListController?.close();
  }
}
