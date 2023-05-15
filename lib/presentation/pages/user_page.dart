import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            bool exit = await onExit();
            if (exit) {
              await FirebaseAuth.instance.signOut();
              setState(() {});
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [BottomNavigationBarItem(icon: Icon(Icons.abc))],
      ),
    );
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