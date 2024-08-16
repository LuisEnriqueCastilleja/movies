import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/coming_soon_movies/coming_soon_movies_response.dart';
import 'package:movies/models/movie/movie_model.dart';

class ComingSoonMoviesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String comingSoonMoviesApi = 'movie/upcoming?language=en-US&page=1';

  Future<List<Movie>?> getComingSoonMoviesList() async {
    final response = await _apiBaseHelper.get(comingSoonMoviesApi);
    return ComingSoonMoviesResponse.fromJson(response).results;
  }
}
