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

//Pagina del Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final navigation = Modular.get<Navigation>();
  //FormKey para checar el estado de nuestro Form
  final _formKey = GlobalKey<FormState>();
  //Controllers de los inputs.
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
                  controller: _usernameController,
                  characterLimitNumber: 50,
                ),
                ExtraStyles.boxHeight40,
                ShowPasswordInput(
                  hint: 'password*',
                  controller: _passwordController,
                  characterLimitNumber: 50,
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
                      //Utilizamos el metodo validate del form para validar los inputs
                      //Para verificar si estan vacios, pero aqui adentro podemos validar mas cosas con respecto al formulario
                      if (_formKey.currentState!.validate()) {
                        //Aqui podriamos agregar un dialogo de cargando y despues hacer la peticion del Login
                        await postLogin();
                        //Cuando acabara la peticion del Login ya quitariamos el dialogo de cargando
                      }
                      //Aqui podriamos agregar el else y poner que en caso de que esten vacios algun dialogo en caso de que lo requeramos
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

//Metodo para llamar el postLogin, este es Future para la cuestion de si queramos agrer un dialogo de cargando
  Future postLogin() async {
    try {
      //Aqui en lugar de ser variables podriamos tener nuestro modelo de login y alimentar
      //Sus propiedades con lo que tenga en la propiedad text los controllers.
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

//LLamamos al metodo para hacer el Login
      return _postLogin(username, password);
    } catch (e) {
      return e;
    }
  }

  void _postLogin(String user, String password) async {
//TODO: Primero se haria la peticion a la API mediante el repositorio y despues guardariamos el response y se lo mandariamos a nuestra clase ApiResponse

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
