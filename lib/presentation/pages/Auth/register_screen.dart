import 'package:event_fit/presentation/pages/Auth/widgets/confirm_error_dialog.dart';
import 'package:event_fit/presentation/pages/Auth/widgets/login_button.dart';
import 'package:event_fit/presentation/pages/Auth/widgets/toggle_auth_option.dart';
import 'package:event_fit/presentation/providers/user_register_provider.dart';
import 'package:event_fit/presentation/widgets/shared/custom_loading_screen.dart';
import 'package:event_fit/presentation/widgets/shared/reusable_widget.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _passwordTextcontroller = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _confirmPasswordTextcontroller =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loadingPage = false;

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'El campo es requerido';
    }
    return null;
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

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<UserRegisterProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              return const Homescreen();
            }

            return SafeArea(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade500, Colors.green.shade300],
                )),
                child: loadingPage
                    ? const CustomLoadingScreen()
                    : Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  reusableTxtfield(
                                      "Email",
                                      Icons.person_outline,
                                      false,
                                      _emailTextcontroller,
                                      validator),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  reusableTxtfield(
                                      "Contraseña",
                                      Icons.lock_outline,
                                      true,
                                      _passwordTextcontroller,
                                      validator),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  reusableTxtfield(
                                      "Confirma tu contraseña",
                                      Icons.lock_outline,
                                      true,
                                      _confirmPasswordTextcontroller, (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'El campo es requerido';
                                    }
                                    if (value != _passwordTextcontroller.text) {
                                      return "La contraseñas no coinciden";
                                    }
                                    return null;
                                  }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AuthButton(
                                    onPress: () => register(registerProvider),
                                    type: ButtonTypes.register,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final result = await registerProvider
                                          .registerWithGoogle();
                                      if (result != null)
                                        print("TODO BIEN!");
                                      else
                                        print("TODO MAL!");
                                    },
                                    child: const Text(
                                      "Registrarse con Google",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ToggleAuthOption(
                                    text: "¿Todavía no tienes una cuenta?",
                                    onTap: () => Navigator.pop(context),
                                  )
                                ]),
                          ),
                        ),
                      ),
              ),
            );
          }),
    );
  }

  void register(UserRegisterProvider registerProvider) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    final String errorMessage =
        await registerProvider.registerWithEmailAndPassword(
      email: _emailTextcontroller.text,
      password: _passwordTextcontroller.text,
    );

    if (errorMessage != 'OK') {
      showError(errorMessage);
    }

    setState(() {
      loadingPage = false;
    });
  }
}
