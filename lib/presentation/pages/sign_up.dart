import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:event_fit/presentation/pages/opt.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../common/helpers/color.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => SingUpState();
}

class SingUpState extends State<SingUp> {
  final TextEditingController _passwordTextcontroller = TextEditingController();
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _userNameTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sing Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("6096B4"),
          hexStringToColor("93BFCF"),
          hexStringToColor("BDCDD6")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTxtfield("Enter User Name", Icons.person_outline, false,
                    _userNameTextcontroller),
                const SizedBox(
                  height: 20,
                ),
                reusableTxtfield("Entrer Email", Icons.person_outline, false,
                    _emailTextcontroller),
                const SizedBox(
                  height: 20,
                ),
                reusableTxtfield("Enter Password", Icons.lock_outline, true,
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
                            builder: (context) => const Homescreen()));
                  }).onError((error, stackTrace) {});
                })
              ]),
        ),
      ),
    );
  }
}
