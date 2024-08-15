import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/popular_movies/popular_movies_model.dart';
import 'package:movies/models/popular_movies/popular_movies_response.dart';

class PopularMoviesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String popularMoviesApi = 'movie/popular?language=en-US&page=1&region=en';

  Future<List<PopularMovies>?> getPopularMoviesList() async {
    final response = await _apiBaseHelper.get(popularMoviesApi);
    return PopularMoviesResponse.fromJson(response).results;
  }
}
