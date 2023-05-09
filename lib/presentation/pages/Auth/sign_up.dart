import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => SingUpScreenState();
}

class SingUpScreenState extends State<SingUpScreen> {
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
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade500, Colors.green.shade300],
                )),
                child: loadingPage
                    ? const LinearProgressIndicator()
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
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
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
                                  singInsingUpButton(context, false, () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    _formKey.currentState!.save();

                                    try {
                                      final user = await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: _emailTextcontroller.text,
                                        password: _passwordTextcontroller.text,
                                      );
                                      //TODO: go to home
                                    } on FirebaseAuthException catch (e) {
                                      String errorMessage =
                                          'Un error desconocido ocurrio.';

                                      if (e.code == 'weak-password') {
                                        errorMessage =
                                            'Su contraseña es muy debíl';
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        errorMessage =
                                            'El email ya se encuentra registrado';
                                      }

                                      showError(errorMessage);
                                    } finally {
                                      setState(() {
                                        loadingPage = false;
                                      });
                                    }
                                  }),
                                  signUpOption()
                                ]),
                          ),
                        ),
                      ),
              ),
            );
          }),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const Homescreen()));
        },
        child: const Text(
          " ¿Ya tienes una cuenta? ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
