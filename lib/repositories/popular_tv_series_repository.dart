import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_response.dart';

class PopularTvSeriesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String popularTvSeriesApi = 'tv/popular?language=en-US&page=1';

  Future<List<PopularTvSeries>?> getPopularTvSeriesList() async {
    final response = await _apiBaseHelper.get(popularTvSeriesApi);
    return PopularTvSeriesResponse.fromJson(response).results;
  }
}
