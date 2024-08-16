import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/models/movie/movie_response.dart';

class TrendingMoviesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String trendingMoviesApi = 'trending/movie/day?language=en-US';

  Future<List<Movie>?> getTrendingMoviesList() async {
    final response = await _apiBaseHelper.get(trendingMoviesApi);
    return MovieResponse.fromJson(response).results;
  }
}
