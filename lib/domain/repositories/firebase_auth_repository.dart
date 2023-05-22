import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<String> loginWithUserAndPassword(
      {required String email, required String password});

  Future<String> registerWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential?> registerWithGoogle();
  Future<UserCredential?> loginGoogle();
}
