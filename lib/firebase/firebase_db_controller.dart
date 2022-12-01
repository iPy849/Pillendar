import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthController extends ChangeNotifier {
  // Singleton
  static FirebaseAuthController? firebaseAuthController;

  static FirebaseAuthController getInstance() {
    if (firebaseAuthController == null) {
      FirebaseAuthController.firebaseAuthController = FirebaseAuthController();
    }
    return FirebaseAuthController.firebaseAuthController!;
  }

  // Instance
  late FirebaseAuth firebaseAuthInstance;

  FirebaseAuthController() {
    if (firebaseAuthController != null) {
      throw Exception(
          "Para acceder a FirebaseAuthController usa el método estático \"getInstance\"");
    }
    firebaseAuthInstance = FirebaseAuth.instance;
  }

  Future<User?> firebaseAuthenticate(String email, String password) async {
    try {
      final credential = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> firebaseForgotPassword(String email) async {
    try {
      await firebaseAuthInstance.sendPasswordResetEmail(
        email: email,
      );
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> firebaseCreateUser(String email, String password) async {
    try {
      final credential =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  User? firebaseGoogleAuth() {
    return null;
  }

  // TODO: Probablemente no haga esto
  User? firebaseFacebookAuth() {
    return null;
  }
}
