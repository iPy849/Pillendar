import 'package:pillendar_app/model/user.dart';

class Settings {
  // Bypass para login
  static bool bypassAuth = true;
  static User testUser = User(
    email: "aleortega849@gmail.com",
    uid: "124jb1asjn3_·",
    username: "aleortega849",
  );

  // Los lenguajes solo son "es" y "en"
  static String lang = "en";
  static bool isDarkTheme = false;
}
