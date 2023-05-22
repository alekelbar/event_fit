import 'package:event_fit/domain/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRegisterProvider extends ChangeNotifier {
  final FirebaseAuthRepository repository;

  UserRegisterProvider({required this.repository});

  Future<String> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    final result = await repository.registerWithEmailAndPassword(
        email: email, password: password);

    notifyListeners();
    return result;
  }

  Future<UserCredential?> registerWithGoogle() async {
    return repository.registerWithGoogle();
  }
}
