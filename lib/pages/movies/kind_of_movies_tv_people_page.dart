import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/movies_tv_people_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/pages/movies/list_of_movies_tv_people.dart';
import 'package:movies/widgets/buttons/floating_button.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';

class KindOfMoviesTvPeoplePage extends StatefulWidget {
  const KindOfMoviesTvPeoplePage({super.key});

  @override
  State<KindOfMoviesTvPeoplePage> createState() =>
      _KindOfMoviesTvPeoplePageState();
}

class _KindOfMoviesTvPeoplePageState extends State<KindOfMoviesTvPeoplePage> {
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What kind of movies and series do tou like ?'),
            ExtraStyles.boxHeight05,
            const Text('choose 5'),
            StreamBuilder<ApiResponse<List<Trending>>>(
              stream: _moviesTvPeopleBloc.movieTvPeopleListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data?.status) {
                    case Status.loading:
                      return const LoadingWidget(
                          loadingMessage: 'Loading movies and series');
                    case Status.completed:
                      listOfTrending = snapshot.data!.data!;
                      return ListOfMoviesTvPeople(
                        listOfTrending: listOfTrending,
                      );
                    case Status.error:
                      return ErrorMessageWidget(
                          errorMessage:
                              'Error Loading Movies, TV Series and People',
                          onRetryPressed: () =>
                              _moviesTvPeopleBloc.fetchMoviesTvPeopleList());
                    case null:
                      break;
                  }
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
