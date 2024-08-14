import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/style_movies.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Function() onTap;
  const TextButtonWidget({
    super.key,
    required this.title,
    this.textStyle = StyleMovies.whiteMedium16,
    this.backgroundColor = ColorsMovies.darkBlue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Text(
        title,
        style: textStyle,
      ),
      onPressed: () => onTap(),
    );
  }
}
