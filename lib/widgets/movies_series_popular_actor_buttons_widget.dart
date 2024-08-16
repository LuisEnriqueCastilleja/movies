import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/widgets/buttons/text_button_widget.dart';

//Botones de movies, TV series y actores populares
class MoviesSeriesPopularActorButtonsWidget extends StatefulWidget {
  const MoviesSeriesPopularActorButtonsWidget({super.key});

  @override
  State<MoviesSeriesPopularActorButtonsWidget> createState() =>
      _MoviesSeriesPopularActorButtonsWidgetState();
}

class _MoviesSeriesPopularActorButtonsWidgetState
    extends State<MoviesSeriesPopularActorButtonsWidget> {
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
