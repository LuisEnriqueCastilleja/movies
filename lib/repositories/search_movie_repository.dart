import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/models/movie/movie_response.dart';

class SearchMoviesRepository {
  //Instanciamos un objeto de la clase ApiBaseHelper para hacer las peticiones
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  //URL adicional que necesita el _apiBaseHelper para hacer la peticion
  String moviesFilterApi = 'search/movie?query=';

//Metodo para traer el listado de las peliculas filtradas, recibe un string con el filtro
  Future<List<Movie>?> filterMovies(String search) async {
    //COn el Uri.endodeComponente nos aseguramos que la API reciba bien el filtro ya que puede contener
    //Espacios en blanco y este metodo remueve los espacios en blanco y agrega %20 como lo necesita la API
    String encodedQuery = Uri.encodeComponent(search).toLowerCase();

    //guardamos el response que devuelve el metodo GET del apiBaseHelper
    final response = await _apiBaseHelper.get(
        '$moviesFilterApi$encodedQuery&include_adult=false&language=en-US&page=1');
    //Utilizamos el response para mapear el response que nos devolvio la API
    return MovieResponse.fromJson(response).results;
  }
}
