import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:event_fit/presentation/pages/opt.dart';
import 'package:event_fit/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../common/helpers/color.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final TextEditingController _passwordTextcontroller = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              hexStringToColor("6096B4"),
              hexStringToColor("93BFCF"),
              hexStringToColor("BDCDD6")
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter // paleta de corlores del fondo
                )),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  reusableTxtfield("Enter user name", Icons.person_2_outlined,
                      false, _emailTextcontroller),
                  const SizedBox(height: 20),
                  reusableTxtfield("Enter password", Icons.lock_outline, true,
                      _passwordTextcontroller),
                  const SizedBox(height: 20),
                  singInsingUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextcontroller.text,
                            password: _passwordTextcontroller.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homescreen()));
                    }).onError((error, stackTrace) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content:
                                const Text(" Email o Contraseña incorrecta"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(" Don't have account? ",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OtpPage()));
        },
        child: const Text(
          " Sing Up ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
