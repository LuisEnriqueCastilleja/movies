import 'package:movies/models/trending/trending_model.dart';

class TrendingMoviesTvPeople {
  List<Trending>? listOfTrending;

  TrendingMoviesTvPeople({
    this.listOfTrending,
  });

  factory TrendingMoviesTvPeople.fromJson(Map<String, dynamic> json) =>
      TrendingMoviesTvPeople(
        listOfTrending: json["results"] != null
            ? List<Trending>.from(
                json["results"].map((x) => Trending.fromJson(x)))
            : null,
      );
}
