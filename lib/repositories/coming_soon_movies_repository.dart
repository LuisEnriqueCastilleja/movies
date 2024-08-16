import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/coming_soon_movies/coming_soon_movies_response.dart';
import 'package:movies/models/movie/movie_model.dart';

//TODO: Aqui explico como funcionan los repositorios.
class ComingSoonMoviesRepository {
  //Instanciamos un objeto de la clase ApiBaseHelper para hacer las peticiones
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  //URL adicional que necesita el _apiBaseHelper para hacer la peticion
  String comingSoonMoviesApi = 'movie/upcoming?language=en-US&page=1';

//Metodo para traer el listado de las proximas peliculas
  Future<List<Movie>?> getComingSoonMoviesList() async {
    //Guardamos el response que devuelve el metodo GET del apiBaseHelper
    final response = await _apiBaseHelper.get(comingSoonMoviesApi);
    //Utilizamos el response para mapear el response que nos devolvio la API
    return ComingSoonMoviesResponse.fromJson(response).results;
  }
}
