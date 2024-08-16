import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/pages/home/popular_tv_series_home_list.dart';
import 'package:movies/pages/home/popular_movies_home_list.dart';
import 'package:movies/widgets/movies_series_popular_actor_buttons_widget.dart';
import 'package:movies/pages/home/on_trend_home_list.dart';
import 'package:movies/pages/home/top_rated_tv_series_home_list.dart';
import 'package:movies/widgets/title_and_icon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200.0, child: PopularMoviesHomeList()),
          ExtraStyles.boxHeight20,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: MoviesSeriesPopularActorButtonsWidget(),
          ),
          ExtraStyles.boxHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'On trend',
              onTap: () => navigation.goToOnTrendPage(),
            ),
          ),
          ExtraStyles.boxHeight05,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: OnTrendHomeList()),
          ),
          ExtraStyles.boxHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'Most popular tv series',
              onTap: () => navigation.goToMostPopularTvSeriesPage(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: PopularTvSeriesHomeList()),
          ),
          ExtraStyles.boxHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'Top rated tv series',
              onTap: () => navigation.goToTopRatedTvSeriesPage(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: TopRatedTvSeriesHomeList()),
          ),
          ExtraStyles.boxHeight20,
        ],
      ),
    );
  }
}
