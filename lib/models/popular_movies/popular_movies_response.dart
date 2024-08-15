import 'package:movies/models/popular_movies/popular_movies_model.dart';

class PopularMoviesResponse {
  int? page;
  List<PopularMovies>? results;
  int? totalPages;
  int? totalResults;

  PopularMoviesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((item) => PopularMovies.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
