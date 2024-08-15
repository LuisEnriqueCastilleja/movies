import 'package:flutter/material.dart';
import 'package:movies/helpers/font_awesome.dart';

class BackArrow extends StatelessWidget {
  final Function() onTap;

  const BackArrow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(child: FontAwesome.cianAlert40),
        ),
      ),
    );
  }
}
