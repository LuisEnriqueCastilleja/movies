import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/widgets/buttons/grey_button_widget.dart';
import 'package:movies/widgets/buttons/login_with_button_widget.dart';
import 'package:movies/widgets/inputs/input_text.dart';
import 'package:movies/widgets/inputs/show_password_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final navigation = Modular.get<Navigation>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    '¡Welcome to the best catalog of movies and series!',
                    style: StyleMovies.blackMedium16,
                    textAlign: TextAlign.center,
                  ),
                ),
                ExtraStyles.boxHeight20,
                const Center(
                  child: Text(
                    'Sign Up',
                    style: StyleMovies.blackMedium18,
                    textAlign: TextAlign.center,
                  ),
                ),
                ExtraStyles.boxHeight40,
                InputText(
                    hint: 'username*',
                    type: TextInputType.text,
                    controller: _usernameController),
                ExtraStyles.boxHeight40,
                ShowPasswordInput(
                  hint: 'password*',
                  controller: _passwordController,
                ),
                ExtraStyles.boxHeight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Text('Forgot password?'),
                      onTap: () => {
                        //TODO: Redirigir a la pagina de recuperar contraseña
                      },
                    ),
                  ],
                ),
                ExtraStyles.boxHeight30,
                GreyButtonWidget(
                    backgroundColor: ColorsMovies.darkBlue,
                    textStyle: StyleMovies.whiteMedium16,
                    title: 'Log in',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await postLogin();
                      }
                    }),
                ExtraStyles.boxHeight50,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: ColorsMovies.loginGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'or continue with',
                        style: StyleMovies.grayMedium12,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: ColorsMovies.loginGrey,
                      ),
                    ),
                  ],
                ),
                ExtraStyles.boxHeight30,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LoginWithButtonWidget(
                        title: 'Google',
                        imagePath: 'assets/img/google.png',
                        onTap: () {
                          //TODO: Implementar metodo para iniciar sesion por Google
                        },
                      ),
                    ),
                    ExtraStyles.boxWidth10,
                    Expanded(
                      child: LoginWithButtonWidget(
                        title: 'Facebook',
                        imagePath: 'assets/img/facebook.png',
                        onTap: () {
                          //TODO: Implementar metodo para iniciar sesion por Facebook
                        },
                      ),
                    )
                  ],
                ),
                ExtraStyles.boxHeight30,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future postLogin() async {
    try {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      return _postLogin(username, password);
    } catch (e) {
      return e;
    }
  }

  void _postLogin(String user, String password) async {
//TODO: Primero se haria la peticion a la API mediante el repositorio y despues guardariamos el response y se lo mandariamos nuestra clase ApiResponse

//TODO: Aqui mediante la clase ApiResponse y su metodo validateResponse veo que me devolvio la API, si devolvio un 200 lo redirigiria a la pagina que debe ir
//Tambien validamos los errores

    // ApiResponse.validateResponse(
    //   context: context,
    //   response: response,
    //   responseSuccessMessage: '',
    //   responseSystemErrorMessage: '',
    //   navigationWhenSuccess: () => navigation.goToKindOfMoviesTvPeople(),
    //   error400Message: '',
    // );

    navigation.goToKindOfMoviesTvPeople();
  }
}
