import 'package:event_fit/domain/datasources/firebase_auth_datasource.dart';
import 'package:event_fit/domain/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuthDataSource datasource;

  FirebaseAuthRepositoryImpl({required this.datasource});

  @override
  Future<String> loginWithUserAndPassword(
      {required String email, required String password}) async {
    return datasource.loginWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<String> registerWithEmailAndPassword(
      {required String email, required String password}) {
    return datasource.registerWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential?> registerWithGoogle() {
    return datasource.registerWithGoogle();
  }

  @override
  Future<UserCredential?> loginGoogle() {
    return datasource.loginWithGoogle();
  }
}
