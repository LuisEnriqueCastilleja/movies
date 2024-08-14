import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/widgets/buttons/text_button_widget.dart';

class MoviesSeriesPopularActorButtons extends StatefulWidget {
  const MoviesSeriesPopularActorButtons({super.key});

  @override
  State<MoviesSeriesPopularActorButtons> createState() =>
      _MoviesSeriesPopularActorButtonsState();
}

class _MoviesSeriesPopularActorButtonsState
    extends State<MoviesSeriesPopularActorButtons> {
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButtonWidget(
          title: 'Movies',
          onTap: () => navigation.goToMoviesPage(),
        ),
        ExtraStyles.boxWidth10,
        TextButtonWidget(
          title: 'Series',
          onTap: () => navigation.goToSeriesPage(),
        ),
        ExtraStyles.boxWidth10,
        TextButtonWidget(
          title: 'Popular actors',
          onTap: () => navigation.goToPopularActorsPage(),
        ),
      ],
    );
  }
}
