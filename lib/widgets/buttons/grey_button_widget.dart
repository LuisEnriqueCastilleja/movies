import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/style_movies.dart';

//Boton gris general
class GreyButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function() onTap;

  const GreyButtonWidget({
    super.key,
    this.backgroundColor = ColorsMovies.darkGrey,
    this.textStyle = StyleMovies.blackMedium20,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () => onTap(),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
