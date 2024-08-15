import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';

class CardMovieTitleAndImageWidget extends StatelessWidget {
  final dynamic object;

  const CardMovieTitleAndImageWidget({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FadeInImage.assetNetwork(
            fadeInDuration: const Duration(milliseconds: 300),
            fit: BoxFit.cover,
            placeholder: 'assets/img/fondoGris.jpg',
            image: 'https://image.tmdb.org/t/p/original/${object.backdropPath}',
          ),
        ),
        Text(
          object.originalTitle ?? object.originalName ?? '',
          style: StyleMovies.blackMedium14,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
