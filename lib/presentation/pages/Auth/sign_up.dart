import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/Auth/sing_in.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
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
  // final TextEditingController _userNameTextcontroller = TextEditingController();

  bool loadingPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
              ),
            ),
            StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  if (loadingPage) return const LinearProgressIndicator();
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        // reusableTxtfield(
                        //     "Usuario", Icons.person_outline, false, _userNameTextcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTxtfield("Email", Icons.person_outline, false,
                            _emailTextcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTxtfield("Contraseña", Icons.lock_outline, true,
                            _passwordTextcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        singInsingUpButton(context, false, () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextcontroller.text,
                                  password: _passwordTextcontroller.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapScreen()));
                          }).onError((error, stackTrace) {});
                        }),
                        signUpOption()
                      ]);
                }),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SingInScreen()));
        },
        child: const Text(
          " ¿Ya tienes una cuenta? ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
