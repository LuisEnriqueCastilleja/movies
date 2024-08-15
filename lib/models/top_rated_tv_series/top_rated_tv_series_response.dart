import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';

class TopRatedTvSeriesResponse {
  int? page;
  List<TopRatedTvSeries>? results;
  int? totalPages;
  int? totalResults;

  TopRatedTvSeriesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  TopRatedTvSeriesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((item) => TopRatedTvSeries.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
