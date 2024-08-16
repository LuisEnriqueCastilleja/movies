import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_tv_series_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/pages/home/most_popular_tv_series/list_of_most_popular_tv_series.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';

class MostPopularTvSeriesPage extends StatefulWidget {
  const MostPopularTvSeriesPage({super.key});

  @override
  State<MostPopularTvSeriesPage> createState() =>
      _MostPopularTvSeriesPageState();
}

class _MostPopularTvSeriesPageState extends State<MostPopularTvSeriesPage> {
  final PopularTvSeriesBloc _popularTvSeriesBloc = PopularTvSeriesBloc();
  List<PopularTvSeries> listOfPopularTvSeries = [];

  @override
  void initState() {
    _popularTvSeriesBloc.fetchPopularTvSeriesList();
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              ExtraStyles.boxHeight20,
              const Text(
                'Most populart tv series',
                style: StyleMovies.blackMedium20,
              ),
              ExtraStyles.boxHeight20,
              StreamBuilder<ApiResponse<List<PopularTvSeries>>>(
                stream: _popularTvSeriesBloc.popularTvSeriesListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data?.status) {
                      case Status.loading:
                        return const LoadingWidget(
                            loadingMessage: 'Loading on trend movies');
                      case Status.completed:
                        listOfPopularTvSeries = snapshot.data!.data!;
                        //TODO: implement GridCardsWidget
                        return ListOfMostPopularTvSeries(
                          listOfPopularTvSeries: listOfPopularTvSeries,
                        );
                      case Status.error:
                        return ErrorMessageWidget(
                            errorMessage:
                                'Error Loading most popular tv series',
                            onRetryPressed: () => _popularTvSeriesBloc
                                .fetchPopularTvSeriesList());
                      case null:
                        break;
                    }
                  }
                  return Container();
                },
              ),
            ],
          ),
        ));
  }
}
