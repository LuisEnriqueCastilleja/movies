import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/helpers/style_movies.dart';

class ShowPasswordInput extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final int? characterLimitNumber;
  const ShowPasswordInput(
      {super.key,
      required this.hint,
      required this.controller,
      this.characterLimitNumber});

  @override
  State<ShowPasswordInput> createState() => _ShowPasswordInputState();
}

class _ShowPasswordInputState extends State<ShowPasswordInput> {
  //Para manejar cuando hace focus o no en el input
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.transparent;
  //Variable para mostrar o no la contraseña
  bool _enablePassword = true;

  @override
  void initState() {
    _enablePassword = true;

    //Agregamos el listener para cambiar el color de fondo del input
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
    //Metodo para validar si el input esta vacio
    validateField(value) {
      if (value.trim().isEmpty) {
        //Mensaje que se mostrara cuando entra el metodo de validacion del form
        return 'Please fill required fields';
      }
    }

    return TextFormField(
      validator: (value) {
        //Para validar cuando el input esta vacio u otras validaciones
        String? res = validateField(value);
        return res;
      },
      //Listado de formatters que recibe el input, aqui agregamos las validaciones del input
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        //Limite de caracteres en el input
        LengthLimitingTextInputFormatter(widget.characterLimitNumber)
      ],
      //Para mostrar o no la contraseña
      obscureText: _enablePassword,
      controller: widget.controller,
      cursorColor: ColorsMovies.darkBlue,
      keyboardType: TextInputType.visiblePassword,
      focusNode: _textFieldFocus,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
        enabled: true,
        labelText: widget.hint,
        labelStyle: StyleMovies.grayMedium14,
        floatingLabelStyle: StyleMovies.blackMedium16,
        fillColor: _color,
        filled: true,
        //Cuando le de al icono del "ojo" cambiamos entre mostrar y no mostrar la contaseña
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _enablePassword = !_enablePassword;
              });
            },
            icon: (_enablePassword)
                ? FontAwesome.greyEyeSlash20
                : FontAwesome.cianSolidEye20),
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
