import 'package:event_fit/presentation/common/widgets/reusable_widget.dart';
import 'package:event_fit/presentation/pages/Auth/opt.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
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

  void goToMapScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const MapScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
            gradient: LinearGradient(
                colors: [
              Colors.blueGrey.shade500,Colors.green.shade300
             
            ],)),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      children: <Widget>[
                        reusableTxtfield("Usuario", Icons.person_2_outlined,
                            false, _emailTextcontroller),
                        const SizedBox(height: 20),
                        reusableTxtfield("Contraseña", Icons.lock_outline, true,
                            _passwordTextcontroller),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.12,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                loadingPage = true;
                              });
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailTextcontroller.text,
                                        password: _passwordTextcontroller.text);
                                goToMapScreen();
                              } catch (error) {
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
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OtpPage()));
        },
        child: const Text(
          " ¿Todavía no tienes una cuenta? ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
