import 'package:flutter/material.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/helpers/style_movies.dart';

//Widget con Titulo y icono
class TitleAndIconWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const TitleAndIconWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: StyleMovies.blackMedium20,
        ),
        IconButton(
            onPressed: () => onTap(), icon: FontAwesome.darkBlueAngleRight20)
      ],
    );
  }
}
