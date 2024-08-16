import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/models/movie/movie_response.dart';

class TopRatedMoviesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String topRatedMoviesApi = 'movie/top_rated?language=en-US&page=1';

  Future<List<Movie>?> getTopRatedMoviesList() async {
    final response = await _apiBaseHelper.get(topRatedMoviesApi);
    return MovieResponse.fromJson(response).results;
  }
}
