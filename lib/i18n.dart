import 'package:pillendar_app/settings.dart';

// ignore: camel_case_types
class i18n {
  static const Map<String, String> _es = {
    "Login_view_title": "Pillendar",
    "Login_view_email_input_label": "Correo",
    "Login_view_email_input_hint": "Escriba su correo",
    "Login_view_email_input_incorrect": "Escriba un email correcto",
    "Login_view_password_input_label": "Constraseña",
    "Login_view_password_input_hint": "Escriba su contraseña",
    "Login_view_password_input_incorrect": "Escriba su contraseña",
    "Login_view_login_submit_button": "Ingresar",
    "Login_view_forget_password_button": "Olvidé mi contraseña",
    "Login_view_create_new_profile_button": "Todavía no tengo una cuenta",
  };

  static const Map<String, String> _en = {
    "Login_view_title": "Pillendar",
    "Login_view_email_input_label": "Email",
    "Login_view_email_input_hint": "Type an email",
    "Login_view_email_input_incorrect": "Type a correct email",
    "Login_view_password_input_label": "Password",
    "Login_view_password_input_hint": "Type your password",
    "Login_view_password_input_incorrect": "Type some password",
    "Login_view_login_submit_button": "Login",
    "Login_view_forget_password_button": "I forgot my password",
    "Login_view_create_new_profile_button": "I don't have an account yet",
  };

  static String getText(String key) {
    if (Settings.lang == "es") {
      return i18n._es[key]!;
    } else {
      return i18n._en[key]!;
    }
  }
}
