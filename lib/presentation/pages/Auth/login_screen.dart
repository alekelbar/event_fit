import 'package:event_fit/infrastructure/datasources/publish_datasource_impl.dart';
import 'package:event_fit/infrastructure/repositories/publish_repository_impl.dart';
import 'package:event_fit/presentation/pages/Auth/register_screen.dart';
import 'package:event_fit/presentation/pages/Auth/widgets/login_button.dart';
import 'package:event_fit/presentation/pages/Auth/widgets/toggle_auth_option.dart';
import 'package:event_fit/presentation/providers/user_login_provider.dart';
import 'package:event_fit/presentation/pages/Auth/widgets/confirm_error_dialog.dart';
import 'package:event_fit/presentation/providers/user_register_provider.dart';
import 'package:event_fit/presentation/widgets/shared/custom_loading_screen.dart';
import 'package:event_fit/presentation/widgets/shared/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth_buttons/auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextcontroller = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  bool loadingPage = false;

  final _formKey = GlobalKey<FormState>();

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'El campo es requerido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<UserLoginProvider>();
    final size = MediaQuery.of(context).size;

    PublishRepositoryImpl repo =
        PublishRepositoryImpl(datasource: PublishDatasourceImpl());

    print("\nhello world!\n");

    // repo.createPublish(
    //     publish: Publish(
    //         id: "",
    //         like: 0,
    //         userId: "#001",
    //         title: "¡De paseo!",
    //         siteDescription: "En una playa de méxico",
    //         imageUrl:
    //             "https://th.bing.com/th/id/OIP.kledA06j2arvt0d3ndXciAHaNK?pid=ImgDet&rs=1",
    //         pointOne: const LatLng(100, 100),
    //         pointTwo: const LatLng(100, 100)));

    // final list = repo.readPublishes();
    // final list = repo.readPublishById(id: "I03sopkgKjdw8aMlqOlv");
    // final list = repo.readPublishByUserId(userId: "#001");

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey.shade500, Colors.green.shade300],
        )),
        child: loadingPage
            ? const CustomLoadingScreen()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                          width: size.width,
                          height: size.height / 3,
                        ),
                        reusableTxtfield(
                          "Usuario",
                          Icons.person_2_outlined,
                          false,
                          _emailTextcontroller,
                          validator,
                        ),
                        const SizedBox(height: 20),
                        reusableTxtfield(
                          "Contraseña",
                          Icons.lock_outline,
                          true,
                          _passwordTextcontroller,
                          validator,
                        ),
                        const SizedBox(height: 20),
                        AuthButton(
                          type: ButtonTypes.login,
                          onPress: () => login(loginProvider),
                        ),
                        GoogleAuthButton(
                          text: 'Iniciar sesión con Google',
                          style: const AuthButtonStyle(
                            borderRadius: 90,
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          onPressed: () async {
                            final result =
                                await loginProvider.loginWithGoogle();
                            if (result != null) {
                              debugPrint("TODO BIEN!");
                            } else {
                              debugPrint("TODO MAL!");
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        ToggleAuthOption(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (context) => UserRegisterProvider(
                                    repository: loginProvider.repository,
                                  ),
                                  child: const RegisterScreen(),
                                ),
                              )),
                          text: "¿Todavía no tienes una cuenta?",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void login(UserLoginProvider loginProvider) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    setState(() {
      loadingPage = true;
    });

    final String result = await loginProvider.loginWithEmailAndPassword(
      password: _passwordTextcontroller.text,
      email: _emailTextcontroller.text,
    );

    if (result != "OK") {
      showError(result);
    }

    setState(() {
      loadingPage = false;
    });
  }

  void showError(String message) async {
    await showDialog(
        context: context,
        builder: (_) {
          return ConfirmErrorDialog(
            context: context,
            message: message,
          );
        });
  }
}
