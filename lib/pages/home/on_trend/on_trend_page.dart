import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/movies_tv_people_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class OnTrendPage extends StatefulWidget {
  const OnTrendPage({super.key});

  @override
  State<OnTrendPage> createState() => _OnTrendPageState();
}

class _OnTrendPageState extends State<OnTrendPage> {
  final MoviesTvPeopleBloc _moviesTvPeopleBloc = MoviesTvPeopleBloc();
  List<Trending> listOfTrending = [];

  @override
  void initState() {
    _moviesTvPeopleBloc.fetchMoviesTvPeopleList();
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
                  'On trend',
                  style: StyleMovies.blackMedium20,
                ),
                ExtraStyles.boxHeight20,
                StreamBuilder<ApiResponse<List<Trending>>>(
                  stream: _moviesTvPeopleBloc.movieTvPeopleListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data?.status) {
                        case Status.loading:
                          return const LoadingWidget(
                              loadingMessage: 'Loading on trend movies');
                        case Status.completed:
                          listOfTrending = snapshot.data!.data!;
                          return GridCardsWidget(
                            titleNoAvailable:
                                'No movies, tv series on trend available.',
                            listOfObjects: listOfTrending,
                          );
                        case Status.error:
                          return ErrorMessageWidget(
                              errorMessage: 'Error Loading on trend',
                              onRetryPressed: () => _moviesTvPeopleBloc
                                  .fetchMoviesTvPeopleList());
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
