import 'package:event_fit/presentation/widgets/shared/custom_loading_screen.dart';
import 'package:event_fit/presentation/widgets/shared/reusable_widget.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final TextEditingController _passwordTextcontroller =
      TextEditingController(text: "alex1234");
  final TextEditingController _emailTextcontroller =
      TextEditingController(text: "alekelbar.personal@gmail.com");
  bool loadingPage = false;

  final _formKey = GlobalKey<FormState>();

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
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.12,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();
                              setState(() {
                                loadingPage = true;
                              });
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailTextcontroller.text,
                                        password: _passwordTextcontroller.text);
                                setState(() {});
                              } on FirebaseAuthException catch (_) {
                                showError("Credenciales incorrectas");
                              } finally {
                                setState(() {
                                  loadingPage = false;
                                });
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black26;
                                  }
                                  return Colors.white;
                                }),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        signUpOption(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RoutesNames.registerPage);
        },
        child: const Text(
          " ¿Todavía no tienes una cuenta? ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
