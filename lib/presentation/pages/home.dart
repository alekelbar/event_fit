import 'package:event_fit/domain/repositories/firebase_auth_repository.dart';
import 'package:event_fit/infrastructure/datasources/firebase_auth_datasource_impl.dart';
import 'package:event_fit/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:event_fit/presentation/pages/Auth/login_screen.dart';
import 'package:event_fit/presentation/pages/home/user_page.dart';
import 'package:event_fit/presentation/providers/user_login_provider.dart';
import 'package:event_fit/presentation/widgets/shared/custom_loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthRepository repository = FirebaseAuthRepositoryImpl(
      datasource: FirebaseAuthDatasourceImpl(),
    );

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Si estamos esperando una respuesta del servidor de autenticación
            return const CustomLoadingScreen();
          }

          if (!snapshot.hasData) {
            // Si el usuario está autenticado, redirigir a la pantalla de login
            return SafeArea(
                child: ChangeNotifierProvider(
              create: (context) => UserLoginProvider(repository: repository),
              child: const LoginScreen(),
            ));
          }

          return const SafeArea(child: UserPage());
        });
  }
}
