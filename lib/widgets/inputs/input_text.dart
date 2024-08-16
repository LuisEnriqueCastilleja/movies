import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/regular_expressions.dart';
import 'package:movies/helpers/style_movies.dart';

class InputText extends StatefulWidget {
  final bool isRequired;
  final TextInputType type;
  final String hint;
  final TextEditingController controller;
  final Widget? icon;
  final int? characterLimitNumber;
  final Function(String text)? onChanged;

  const InputText({
    super.key,
    this.isRequired = true,
    required this.hint,
    required this.type,
    required this.controller,
    this.onChanged,
    this.icon,
    this.characterLimitNumber,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.transparent;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = ColorsMovies.lightBlue;
        });
      } else {
        setState(() {
          _color = Colors.transparent;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    validateField(value) {
      if (value.trim().isEmpty) {
        return 'Please fill required fields';
      }
      if (widget.type == TextInputType.emailAddress &&
          !EmailValidator.validate(value)) {
        return 'Please enter a valid email';
      }
    }

    return TextFormField(
      controller: widget.controller,
      validator: (widget.isRequired)
          ? (value) {
              String? res = validateField(value);
              return res;
            }
          : null,
      inputFormatters: (widget.type == TextInputType.number)
          ? [
              RegularExpressions.numbers0_9(),
            ]
          : [
              FilteringTextInputFormatter.singleLineFormatter,
              LengthLimitingTextInputFormatter(widget.characterLimitNumber)
            ],
      onChanged:
          widget.onChanged != null ? (text) => widget.onChanged!(text) : null,
      // obscureText: widget.obscureText != null ? widget.obscureText : false,
      cursorColor: ColorsMovies.darkBlue,
      keyboardType: widget.type,
      focusNode: _textFieldFocus,
      decoration: InputDecoration(
        labelText: widget.hint,
        errorStyle: const TextStyle(height: 0),
        labelStyle: StyleMovies.grayMedium14,
        floatingLabelStyle: StyleMovies.blackMedium16,
        enabled: true,
        icon: widget.icon,
        fillColor: _color,
        filled: true,
        contentPadding: const EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: ColorsMovies.darkBlue)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorsMovies.darkBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorsMovies.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorsMovies.darkBlue),
        ),
      ),
    );
  }
}
