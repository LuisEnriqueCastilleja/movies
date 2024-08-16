import 'package:movies/models/actors/actor_model.dart';

class ActorsReponse {
  int? page;
  List<Actor>? results;
  int? totalPages;
  int? totalResults;

  ActorsReponse({this.page, this.results, this.totalPages, this.totalResults});

  ActorsReponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Actor.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
