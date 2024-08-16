import 'package:movies/models/coming_soon_movies/movies_dates_model.dart';
import 'package:movies/models/movie/movie_model.dart';

class ComingSoonMoviesResponse {
  MoviesDates? moviesDates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  ComingSoonMoviesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  ComingSoonMoviesResponse.fromJson(Map<String, dynamic> json) {
    moviesDates =
        json['dates'] != null ? MoviesDates.fromJson(json['dates']) : null;
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
