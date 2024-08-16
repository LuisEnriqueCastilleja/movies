import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/actors/actor_model.dart';
import 'package:movies/repositories/popular_actors_repository.dart';

class PopularActorsBloc extends Disposable {
  PopularActorsRepository? _popularActorsRepository;
  StreamController<ApiResponse<List<Actor>>>? _popularActorsListController;

  StreamSink<ApiResponse<List<Actor>>> get popularActorsListSink =>
      _popularActorsListController!.sink;
  Stream<ApiResponse<List<Actor>>> get popularActorsListStream =>
      _popularActorsListController!.stream;

  PopularActorsBloc() {
    _popularActorsListController = StreamController<ApiResponse<List<Actor>>>();
    _popularActorsRepository = Modular.get<PopularActorsRepository>();
  }

  Future fetchPopularActors() async {
    popularActorsListSink.add(ApiResponse.loading('Fetching Popular Actors.'));
    try {
      List<Actor>? popularActorsList =
          await _popularActorsRepository?.getPopularActorsList();
      popularActorsListSink.add(ApiResponse.completed(popularActorsList));
    } catch (e) {
      popularActorsListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _popularActorsListController?.close();
  }
}
