import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_response.dart';

class TopRatedTvSeriesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String topRatedTvSeriesApi = 'tv/top_rated?language=en-US&page=1';

  Future<List<TopRatedTvSeries>?> getTopRatedTvSeriesList() async {
    final response = await _apiBaseHelper.get(topRatedTvSeriesApi);
    return TopRatedTvSeriesResponse.fromJson(response).results;
  }
}
