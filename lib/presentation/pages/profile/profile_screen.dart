import 'package:event_fit/presentation/helpers/go_home.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          child: const Text("Salir"),
          onPressed: () async {
            bool exit = await onExit();
            if (exit) {
              await FirebaseAuth.instance.signOut();
              logOut();
            }
          }),
    );
  }

  void logOut() {
    goHome(context);
  }

  Future<bool> onExit() async {
    bool exit = false;
    final size = MediaQuery.of(context).size;

    await showDialog(
        context: context,
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade500, Colors.green.shade300],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Salir",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          exit = true;
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          "Si",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          exit = false;
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        child: const Text(
                          "No",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        )),
                  ],
                )
              ],
            ),
          );
        });
    return exit;
  }
}
