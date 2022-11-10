import 'package:pillendar_app/model/user.dart';

mixin FirebaseAuthController {
  User? firebaseAuth(String email, String password) {
    return null;
  }

  bool firebaseForgotPassword(String email) {
    return false;
  }

  User? firebaseCreateUser(String email) {
    return null;
  }

  User? firebaseGoogleAuth() {
    return null;
  }

  User? firebaseFacebookAuth() {
    return null;
  }
}
