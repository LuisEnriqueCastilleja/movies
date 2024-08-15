import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';
import 'package:movies/repositories/top_rated_tv_series_repository.dart';

class TopRatedTvSeriesBloc extends Disposable {
  TopRatedTvSeriesRepository? _topRatedTvSeriesRepository;
  StreamController<ApiResponse<List<TopRatedTvSeries>>>?
      _topRatedTvSeriesListController;

  StreamSink<ApiResponse<List<TopRatedTvSeries>>>
      get topRatedTvSeriesListSink => _topRatedTvSeriesListController!.sink;
  Stream<ApiResponse<List<TopRatedTvSeries>>> get topRatedTvSeriesListStream =>
      _topRatedTvSeriesListController!.stream;

  TopRatedTvSeriesBloc() {
    _topRatedTvSeriesListController =
        StreamController<ApiResponse<List<TopRatedTvSeries>>>();
    _topRatedTvSeriesRepository = Modular.get<TopRatedTvSeriesRepository>();
  }

  Future fetchTopRatedTvSeriesList() async {
    topRatedTvSeriesListSink
        .add(ApiResponse.loading('Fetching Top Rated TV Series.'));
    try {
      List<TopRatedTvSeries>? topRatedTvSeriesList =
          await _topRatedTvSeriesRepository?.getTopRatedTvSeriesList();
      topRatedTvSeriesListSink.add(ApiResponse.completed(topRatedTvSeriesList));
    } catch (e) {
      topRatedTvSeriesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _topRatedTvSeriesListController?.close();
  }
}
