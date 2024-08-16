import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/helpers/style_movies.dart';

//AppBar sin icono para volver hacia atras
class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onPressedNotifications;
  final Function() onPressedUser;

  const AppBarHomeWidget(
      {super.key,
      required this.title,
      required this.onPressedNotifications,
      required this.onPressedUser});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0.0,
      leading: const SizedBox(),
      shadowColor: ColorsMovies.darkBlue,
      backgroundColor: ColorsMovies.darkBlue,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () => onPressedNotifications(),
                icon: FontAwesome.whiteBell20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: StyleMovies.whiteMedium16,
                ),
                IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () => onPressedUser(),
                    icon: FontAwesome.whiteUser20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
