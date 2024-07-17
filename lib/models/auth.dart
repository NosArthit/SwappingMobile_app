import "package:firebase_auth/firebase_auth.dart";

class Auth{
  // ignore: unused_field
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
}