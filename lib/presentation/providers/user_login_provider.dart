import 'package:event_fit/domain/repositories/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

class UserLoginProvider extends ChangeNotifier {
  final FirebaseAuthRepository repository;

  UserLoginProvider({required this.repository});

  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final result = await repository.loginWithUserAndPassword(
        email: email, password: password);

    notifyListeners();
    return result;
  }
}
