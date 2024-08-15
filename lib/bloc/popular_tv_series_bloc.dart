import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/repositories/popular_tv_series_repository.dart';

class PopularTvSeriesBloc extends Disposable {
  PopularTvSeriesRepository? _popularTvSeriesRepository;
  StreamController<ApiResponse<List<PopularTvSeries>>>?
      _popularTvSeriesListController;

  StreamSink<ApiResponse<List<PopularTvSeries>>> get popularTvSeriesListSink =>
      _popularTvSeriesListController!.sink;
  Stream<ApiResponse<List<PopularTvSeries>>> get popularTvSeriesListStream =>
      _popularTvSeriesListController!.stream;

  PopularTvSeriesBloc() {
    _popularTvSeriesListController =
        StreamController<ApiResponse<List<PopularTvSeries>>>();
    _popularTvSeriesRepository = Modular.get<PopularTvSeriesRepository>();
  }

  Future fetchPopularTvSeriesList() async {
    popularTvSeriesListSink
        .add(ApiResponse.loading('Fetching Popular TV Series.'));
    try {
      List<PopularTvSeries>? popularTvSeriesList =
          await _popularTvSeriesRepository?.getPopularTvSeriesList();
      popularTvSeriesListSink.add(ApiResponse.completed(popularTvSeriesList));
    } catch (e) {
      popularTvSeriesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _popularTvSeriesListController?.close();
  }
}
