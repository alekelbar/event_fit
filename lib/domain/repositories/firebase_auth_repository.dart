abstract class FirebaseAuthRepository {
  Future<String> loginWithUserAndPassword(
      {required String email, required String password});

  Future<String> registerWithEmailAndPassword(
      {required String email, required String password});
}
