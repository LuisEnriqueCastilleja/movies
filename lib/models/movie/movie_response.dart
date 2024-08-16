import 'package:movies/models/movie/movie_model.dart';

//TODO: Aqui explico el response.
//Response que viene de la API, aqui lo mapeamos

//Propiedades del response
class MovieResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  MovieResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

//Igualmente que en el modelo, de un mapa nos traemos la informacion a nuestras propiedades
  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    //El results es el que tiene un listado de objetos, que en este caso son movies
    if (json['results'] != null) {
      //Decimos que lo que tenga el json en 'results' se comporte como una lista para mapearlo
      // y utlizar nuestro metodo fromJson del modelo movie
      results = (json['results'] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
