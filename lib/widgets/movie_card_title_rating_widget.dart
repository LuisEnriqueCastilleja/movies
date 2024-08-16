import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';

class MovieCardTitleRatingWidget extends StatelessWidget {
  final dynamic object;
  const MovieCardTitleRatingWidget({
    super.key,
    required this.object,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              placeholder: 'assets/img/fondoGris.jpg',
              image:
                  'https://image.tmdb.org/t/p/original/${object.backdropPath ?? object.posterPath}',
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${object.originalTitle ?? object.originalName ?? ''}',
                    style: StyleMovies.whiteMedium12,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${object.voteAverage}',
                    style: StyleMovies.whiteMedium12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
