import 'package:event_fit/presentation/pages/Auth/sing_in.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Si estamos esperando una respuesta del servidor de autenticación
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // Si el usuario está autenticado, redirigir a la pantalla de mapa
            return const MapScreen();
          } else {
            // Si el usuario no está autenticado, redirigir a la pantalla de inicio de sesión
            return const SafeArea(child: SingInScreen());
          }
        });
  }
}
