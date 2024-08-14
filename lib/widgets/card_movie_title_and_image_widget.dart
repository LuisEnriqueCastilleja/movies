import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/trending/trending_model.dart';

class CardMovieTitleAndImageWidget extends StatelessWidget {
  final Trending trending;

  const CardMovieTitleAndImageWidget({super.key, required this.trending});

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
            image:
                'https://image.tmdb.org/t/p/original/${trending.backdropPath}',
          ),
        ),
        Text(
          trending.originalTitle ?? '',
          style: StyleMovies.blackMedium14,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
