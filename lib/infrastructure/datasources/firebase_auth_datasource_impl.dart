import 'package:event_fit/domain/datasources/firebase_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasourceImpl implements FirebaseAuthDataSource {
  @override
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "OK";
    } on FirebaseAuthException catch (_) {
      return "Credenciales incorrectas";
    }
  }

  @override
  Future<String> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    String errorMessage = 'Un error desconocido ocurrio.';
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'OK';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'Su contraseña es muy debíl';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'El email ya se encuentra registrado';
      }
    }
    return errorMessage;
  }
}
