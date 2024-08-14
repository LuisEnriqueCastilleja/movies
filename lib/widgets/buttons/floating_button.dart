import 'package:flutter/material.dart';
import 'package:movies/widgets/buttons/green_button.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return GreenButton(title: 'Done', onTap: () => {});
  }
}
