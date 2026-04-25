import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth auth;
  AuthRemoteDataSource(this.auth);

  Future<UserCredential> signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> forgotPassword(String email) {
    return auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() => auth.signOut();
}
