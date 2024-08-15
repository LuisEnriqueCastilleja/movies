import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';

class PopularTvSeriesResponse {
  int? page;
  List<PopularTvSeries>? results;
  int? totalPages;
  int? totalResults;

  PopularTvSeriesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  PopularTvSeriesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((item) => PopularTvSeries.fromJson(item))
          .toList();
    } else {
      results = [];
    }
  }
}
