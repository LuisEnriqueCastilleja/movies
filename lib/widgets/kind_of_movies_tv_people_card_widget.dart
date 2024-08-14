import 'package:flutter/material.dart';
import 'package:movies/models/trending/trending_model.dart';

class KindOfMoviesTvPeopleCardWidget extends StatefulWidget {
  final Trending trending;
  const KindOfMoviesTvPeopleCardWidget({
    super.key,
    required this.trending,
  });

  @override
  State<KindOfMoviesTvPeopleCardWidget> createState() =>
      _KindOfMoviesTvPeopleCardWidgetState();
}

class _KindOfMoviesTvPeopleCardWidgetState
    extends State<KindOfMoviesTvPeopleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fit: BoxFit.cover,
      placeholder: 'assets/img/fondoGris.jpg',
      image:
          'https://image.tmdb.org/t/p/original/${widget.trending.backdropPath}',
    );
  }
}
