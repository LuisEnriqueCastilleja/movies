import 'package:movies/models/trending/trending_model.dart';

class TrendingMoviesTvPeopleResponse {
  int? page;
  List<Trending>? results;
  int? totalPages;
  int? totalResults;

  TrendingMoviesTvPeopleResponse(
      {this.page, this.totalPages, this.totalResults, this.results});

  TrendingMoviesTvPeopleResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((item) => Trending.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
