import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_actors_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/actors/actor_model.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class PopularActorsPage extends StatefulWidget {
  const PopularActorsPage({super.key});

  @override
  State<PopularActorsPage> createState() => _PopularActorsPageState();
}

class _PopularActorsPageState extends State<PopularActorsPage> {
  final PopularActorsBloc _popularActorsBloc = PopularActorsBloc();
  List<Actor> listOfPopularActors = [];

  @override
  void initState() {
    _popularActorsBloc.fetchPopularActors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBackArrowWidget(
          title: 'Hi Luis',
          onPressedBack: () => Modular.to.pop(),
          onPressedNotifications: () => {},
          onPressedUser: () => {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                ExtraStyles.boxHeight20,
                const Text(
                  'Popular actors',
                  style: StyleMovies.blackMedium20,
                ),
                ExtraStyles.boxHeight20,
                StreamBuilder<ApiResponse<List<Actor>>>(
                  stream: _popularActorsBloc.popularActorsListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data?.status) {
                        case Status.loading:
                          return const LoadingWidget(
                              loadingMessage: 'Loading popular actors.');
                        case Status.completed:
                          listOfPopularActors = snapshot.data!.data!;
                          return GridCardsWidget(
                            isPopularActors: true,
                            titleNoAvailable: 'No popular actors available.',
                            listOfObjects: listOfPopularActors,
                          );
                        case Status.error:
                          return ErrorMessageWidget(
                              errorMessage: 'Error Loading popular actors',
                              onRetryPressed: () =>
                                  _popularActorsBloc.fetchPopularActors());
                        case null:
                          break;
                      }
                    }
                    return Container();
                  },
                ),
                ExtraStyles.boxHeight20,
              ],
            ),
          ),
        ));
  }
}
