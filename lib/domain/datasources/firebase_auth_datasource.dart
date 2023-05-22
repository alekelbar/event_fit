import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<String> registerWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential?> registerWithGoogle();
  Future<UserCredential?> loginWithGoogle();
}
