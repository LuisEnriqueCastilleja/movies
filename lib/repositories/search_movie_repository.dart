import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/models/movie/movie_response.dart';

class SearchMoviesRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String moviesFilterApi = 'search/movie?query=';

  Future<List<Movie>?> filterMovies(String search) async {
    String encodedQuery = Uri.encodeComponent(search).toLowerCase();

    final response = await _apiBaseHelper.get(
        '$moviesFilterApi$encodedQuery&include_adult=false&language=en-US&page=1');
    return MovieResponse.fromJson(response).results;
  }
}
