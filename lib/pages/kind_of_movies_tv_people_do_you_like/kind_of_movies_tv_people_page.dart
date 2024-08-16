import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/movies_tv_people_bloc.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/pages/kind_of_movies_tv_people_do_you_like/list_of_movies_tv_people.dart';
import 'package:movies/widgets/buttons/grey_button_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';

//Pagina para escoger 5 peliculas que me gusten
class KindOfMoviesTvPeoplePage extends StatefulWidget {
  const KindOfMoviesTvPeoplePage({super.key});

  @override
  State<KindOfMoviesTvPeoplePage> createState() =>
      _KindOfMoviesTvPeoplePageState();
}

class _KindOfMoviesTvPeoplePageState extends State<KindOfMoviesTvPeoplePage> {
  //Para tener mi objeto para navegar a la siguiente pagina
  final navigation = Modular.get<Navigation>();
  //Instancia del BLoc
  final MoviesTvPeopleBloc _moviesTvPeopleBloc = MoviesTvPeopleBloc();
  List<Trending> listOfTrending = [];

  @override
  void initState() {
    //Utilizamos el metodo del BLoC para traernos los datos
    _moviesTvPeopleBloc.fetchMoviesTvPeopleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What kind of movies and series do you like ?',
              style: StyleMovies.greyMedium23,
            ),
            ExtraStyles.boxHeight05,
            const Text(
              'choose 5',
              style: StyleMovies.grayMedium16,
            ),
            //TODO: Add search
            ExtraStyles.boxHeight10,
            //StreamBuilder para manejar los datos del BLoC
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: GreyButtonWidget(
          title: 'Done',
          backgroundColor: ColorsMovies.darkBlue,
          textStyle: StyleMovies.whiteMedium16,
          onTap: () => navigation.goToMainPage(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
