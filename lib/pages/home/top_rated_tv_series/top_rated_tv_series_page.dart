import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/top_rated_tv_series_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';
import 'package:movies/pages/home/top_rated_tv_series/list_of_top_rated_tv_series.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';

class TopRatedTvSeriesPage extends StatefulWidget {
  const TopRatedTvSeriesPage({super.key});

  @override
  State<TopRatedTvSeriesPage> createState() => _TopRatedTvSeriesPageState();
}

class _TopRatedTvSeriesPageState extends State<TopRatedTvSeriesPage> {
  final TopRatedTvSeriesBloc _topRatedTvSeriesBloc = TopRatedTvSeriesBloc();
  List<TopRatedTvSeries> listOfTopRatedTvSeries = [];

  @override
  void initState() {
    _topRatedTvSeriesBloc.fetchTopRatedTvSeriesList();
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
                'Top rated tv series page',
                style: StyleMovies.blackMedium20,
              ),
              ExtraStyles.boxHeight20,
              StreamBuilder<ApiResponse<List<TopRatedTvSeries>>>(
                stream: _topRatedTvSeriesBloc.topRatedTvSeriesListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data?.status) {
                      case Status.loading:
                        return const LoadingWidget(
                            loadingMessage: 'Loading top rated tv series.');
                      case Status.completed:
                        listOfTopRatedTvSeries = snapshot.data!.data!;
                        //TODO: implement GridCardsWidget
                        return ListOfTopRatedTvSeries(
                          listOfTopRatedTvSeries: listOfTopRatedTvSeries,
                        );
                      case Status.error:
                        return ErrorMessageWidget(
                            errorMessage: 'Error Loading top rated tv series',
                            onRetryPressed: () => _topRatedTvSeriesBloc
                                .fetchTopRatedTvSeriesList());
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
