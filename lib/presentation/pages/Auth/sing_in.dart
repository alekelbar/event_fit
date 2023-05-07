import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/Auth/opt.dart';
import 'package:event_fit/presentation/pages/Auth/sign_up.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final TextEditingController _passwordTextcontroller = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  bool loadingPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  if (loadingPage) return const LinearProgressIndicator();
                  return Column(
                    children: <Widget>[
                      reusableTxtfield("Usuario", Icons.person_2_outlined,
                          false, _emailTextcontroller),
                      const SizedBox(height: 20),
                      reusableTxtfield("Contraseña", Icons.lock_outline, true,
                          _passwordTextcontroller),
                      const SizedBox(height: 20),
                      singInsingUpButton(context, true, () {
                        setState(() {
                          loadingPage = true;
                        });
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextcontroller.text,
                                password: _passwordTextcontroller.text)
                            .then((value) {
                          setState(() {
                            loadingPage = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapScreen()));
                        }).onError((error, stackTrace) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    " Email o Contraseña incorrecta"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      }),
                      signUpOption(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SingUpScreen()));
        },
        child: const Text(
          " ¿Todavía no tienes una cuenta? ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
