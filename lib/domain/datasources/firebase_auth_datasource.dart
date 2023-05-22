abstract class FirebaseAuthDataSource {
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<String> registerWithEmailAndPassword(
      {required String email, required String password});
}
