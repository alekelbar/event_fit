import 'package:flutter/material.dart';

enum ButtonTypes { login, register }

class AuthButton extends StatelessWidget {
  final void Function() onPress;
  final ButtonTypes type;

  const AuthButton({super.key, required this.onPress, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      height: size.width * 0.12,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: onPress,
        // style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.resolveWith((states) {
        //       if (states.contains(MaterialState.pressed)) {
        //         return Colors.black26;
        //       }
        //       return Colors.white;
        //     }),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30)))),
        child: Text(
          ButtonTypes.login == type ? "Iniciar Sesión" : "Registrar",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
