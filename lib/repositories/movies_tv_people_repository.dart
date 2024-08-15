import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/models/trending/trending_movies_tv_people_response.dart';

class MoviesTvPeopleRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String trendingAllApi = 'trending/all/day?language=en-US';

  Future<List<Trending>?> getMoviesTvPeopleList() async {
    final response = await _apiBaseHelper.get(trendingAllApi);
    return TrendingMoviesTvPeopleResponse.fromJson(response).results;
  }
}
