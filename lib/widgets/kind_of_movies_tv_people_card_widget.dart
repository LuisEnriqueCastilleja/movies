import 'package:flutter/material.dart';

class KindOfMoviesTvPeopleCardWidget extends StatefulWidget {
  final dynamic object;
  const KindOfMoviesTvPeopleCardWidget({
    super.key,
    required this.object,
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
      fadeInDuration: const Duration(milliseconds: 300),
      fit: BoxFit.cover,
      placeholder: 'assets/img/fondoGris.jpg',
      image:
          'https://image.tmdb.org/t/p/original/${widget.object.backdropPath ?? widget.object.posterPath}',
    );
  }
}
