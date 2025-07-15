

import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authChangesState => _firebaseAuth.authStateChanges();

  Future<void> loginWithEmailAndPassword(String email, String password)async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password)async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> deconnexion()async{
    await _firebaseAuth.signOut();
  }

}