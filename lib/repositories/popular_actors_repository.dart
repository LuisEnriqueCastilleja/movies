import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/models/actors/actor_model.dart';
import 'package:movies/models/actors/actors_response.dart';

class PopularActorsRepository {
  final ApiBaseHelper _apiBaseHelper = Modular.get<ApiBaseHelper>();
  String popularActorsApi = 'trending/person/day?language=en-US';

  Future<List<Actor>?> getPopularActorsList() async {
    final response = await _apiBaseHelper.get(popularActorsApi);
    return ActorsReponse.fromJson(response).results;
  }
}
