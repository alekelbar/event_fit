import 'package:event_fit/domain/datasources/firebase_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  @override
  Future<UserCredential?> registerWithGoogle() async {
    return loginWithGoogle();
  }

  @override
  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Solicitar la cuenta de Google para iniciar sesión
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtener las credenciales de autenticación de Google
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;

        // Crear las credenciales de Firebase con las credenciales de Google
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Iniciar sesión en Firebase con las credenciales
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential;
      } else {
        // El usuario canceló el inicio de sesión con Google
        return null;
      }
    } catch (e) {
      // el usuario canceló el inicio de sesión o ocurrio un error
      return null;
    }
  }
}
