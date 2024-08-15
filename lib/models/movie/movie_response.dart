import 'package:movies/models/movie/movie_model.dart';

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

  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
