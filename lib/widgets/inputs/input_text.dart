import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/regular_expressions.dart';
import 'package:movies/helpers/style_movies.dart';

//Input
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
  //Para manejar cuando hace focus o no en el input
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.transparent;

  @override
  void initState() {
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
      //SI el tipo del teclado es email agregamos esta validacion para que proporcione un correo valido(No lo utilice en el Login pero igual lo deje como ejemplo)
      if (widget.type == TextInputType.emailAddress &&
          !EmailValidator.validate(value)) {
        //Mensaje que se mostrara cuando entra el metodo de validacion del form
        return 'Please enter a valid email';
      }
    }

    return TextFormField(
      controller: widget.controller,
      //Para validar cuando el input esta vacio u otras validaciones
      validator: (widget.isRequired)
          ? (value) {
              String? res = validateField(value);
              return res;
            }
          : null,
      //Listado de formatters que recibe el input, aqui agregamos las validaciones del input
      inputFormatters: (widget.type == TextInputType.number)
          ? [
              //Para cuando el teclado sea de tipo number utilizamos la expresion regular para que solo pueda poner numero del 0 al 9
              RegularExpressions.numbers0_9(),
            ]
          : [
              FilteringTextInputFormatter.singleLineFormatter,
              //Limite de caracteres en el input
              LengthLimitingTextInputFormatter(widget.characterLimitNumber)
            ],
      //Cuando cambia el valor del input
      onChanged:
          widget.onChanged != null ? (text) => widget.onChanged!(text) : null,
      cursorColor: ColorsMovies.darkBlue,
      keyboardType: widget.type,
      focusNode: _textFieldFocus,
      //Diseño del input
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
