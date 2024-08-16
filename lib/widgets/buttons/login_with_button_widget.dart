import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';

//Boton para loguearte con Google, Facebook, pide el imagePath de la imagen para el boton y titulo del boton
class LoginWithButtonWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Function() onTap;

  const LoginWithButtonWidget({
    super.key,
    required this.title,
    required this.imagePath,
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
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 30.0,
            height: 30.0,
          ),
          ExtraStyles.boxWidth10,
          Text(
            title,
            style: textStyle,
          ),
        ],
      ),
      onPressed: () => onTap(),
    );
  }
}
