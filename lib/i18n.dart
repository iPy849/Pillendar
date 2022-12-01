import 'package:pillendar_app/settings.dart';

// ignore: camel_case_types
class i18n {
  static const Map<String, String> _es = {
    "Loading": "Cargando",
    "Login_view_title": "Pillendar",
    "Login_view_socials_login_title": "Ingresar con:",
    "Login_view_email_input_label": "Correo",
    "Login_view_email_input_hint": "Escriba su correo",
    "Login_view_email_input_incorrect": "Escriba un email correcto",
    "Login_view_password_input_label": "Constraseña",
    "Login_view_password_input_hint": "Escriba su contraseña",
    "Login_view_password_input_incorrect": "Escriba su contraseña",
    "Login_view_login_submit_button": "Ingresar",
    "Login_view_forget_password_button": "Olvidé mi contraseña",
    "Login_view_create_new_profile_button": "Todavía no tengo una cuenta",
    "Login_view_auth_error_toast": "Su email o contraseña es incorrecta",
    "Development_mesaje":
        "Lo sentimos, estamos trabajando sobre esta funcionalidad",
    "Register_view_title": "Registra tu nuevo perfil",
    "Register_view_repeat_password_input_label": "Confirme su contraseña",
    "Register_view_repeat_password_input_hint": "Reescriba su contraseña",
    "Register_view_repeat_password_input_incorrect":
        "Su contraseña no coincide con la anterior",
    "Register_view_return_to_login": "Volver a inicio",
    "Register_view_register_submit_button": "Registrar",
    "Register_view_auth_error_toast":
        "Ya se ha registrado una cuenta con este email",
    "Register_view_auth_success_toast": "Su cuenta se ha creado con éxito",
    "Forgot_password_view_title": "Olvidé mi contraseña",
    "Forgot_password_view_submit_button": "Recuperar mi contraseña",
    "Forgot_password_view_auth_error_toast":
        "Lo sentimos, estamos teniendo problemas en este momento",
    "Forgot_password_view_auth_success_toast":
        "Se ha enviado un email de recuperación a la cuenta señalada",
    "Create_reminder_modal_title_create": "Crea tu recordatorio",
    "Create_reminder_modal_title_edit": "Edita tu recordatorio",
    "Create_reminder_modal_datepicker_text": "¿Cuándo empezaste las dosis?",
    "Create_reminder_modal_datepicker_button": "Selecciona la fecha aquí",
    "Create_reminder_modal_input_pillname_label": "Píldora",
    "Create_reminder_modal_input_pillname_hint":
        "Escriba el nombre de la píldora",
    "Create_reminder_modal_input_pillname_incorrect":
        "Es necesario el nombre de la píldora",
    "Create_reminder_modal_input_dosis_time_in_hours_label":
        "Espera entre dosis (horas)",
    "Create_reminder_modal_input_dosis_time_in_hours_hint":
        "¿Cada cuántas horas te tomas una dosis? ",
    "Create_reminder_modal_input_dosis_time_in_hours_incorrect":
        "Es necesario llenar este campo",
    "Create_reminder_modal_input_cycles_label": "Ciclos",
    "Create_reminder_modal_input_cycles_hint":
        "¿Cuántas veces vas a repetir la dosis?",
    "Create_reminder_modal_input_cycles_incorrect":
        "Es necesario llenar este campo",
    "Create_reminder_modal_confirm_action": "Guardar",
    "Create_reminder_modal_cancel_action": "Cancelar",
  };

  static const Map<String, String> _en = {
    "Loading": "Loading",
    "Login_view_title": "Pillendar",
    "Login_view_socials_login_title": "Login with:",
    "Login_view_email_input_label": "Email",
    "Login_view_email_input_hint": "Type an email",
    "Login_view_email_input_incorrect": "Type a correct email",
    "Login_view_password_input_label": "Password",
    "Login_view_password_input_hint": "Type your password",
    "Login_view_password_input_incorrect": "Type some password",
    "Login_view_login_submit_button": "Login",
    "Login_view_forget_password_button": "I forgot my password",
    "Login_view_create_new_profile_button": "I don't have an account yet",
    "Login_view_auth_error_toast": "Your email or password are invalidad",
    "Development_mesaje": "We are sorry, we still working on this feature",
    "Register_view_title": "Register your new profile",
    "Register_view_repeat_password_input_label": "Password Confirmation",
    "Register_view_repeat_password_input_hint": "Write your password again",
    "Register_view_repeat_password_input_incorrect":
        "Your password does not match each other",
    "Register_view_return_to_login": "Go back to Login",
    "Register_view_register_submit_button": "Register",
    "Register_view_auth_error_toast":
        "There is already an accout with this email",
    "Register_view_auth_success_toast":
        "Your account have been created successfully",
    "Forgot_password_view_title": "I forgot my password",
    "Forgot_password_view_submit_button": "Recover my password",
    "Forgot_password_view_auth_error_toast":
        "We are sorry, we are working in some problems",
    "Forgot_password_view_auth_success_toast":
        "Recovery email successfully sent",
    "Create_reminder_modal_title_create": "Create your reminder",
    "Create_reminder_modal_title_edit": "Edit your reminder",
    "Create_reminder_modal_datepicker_text": "When did you start the doses?",
    "Create_reminder_modal_datepicker_button": "Click to select the date",
    "Create_reminder_modal_input_pillname_label": "Pill name",
    "Create_reminder_modal_input_pillname_hint": "Write the name of the pill",
    "Create_reminder_modal_input_pillname_incorrect":
        "You need to write the name of the pill",
    "Create_reminder_modal_input_dosis_time_in_hours_label":
        "Dosis waiting (hours)",
    "Create_reminder_modal_input_dosis_time_in_hours_hint":
        "How many hours do you wait for every doses? ",
    "Create_reminder_modal_input_dosis_time_in_hours_incorrect":
        "You need to fill this field",
    "Create_reminder_modal_input_cycles_label": "Cycles",
    "Create_reminder_modal_input_cycles_hint":
        "How many times will you repeat the dosis?",
    "Create_reminder_modal_input_cycles_incorrect":
        "You need to fill this field",
    "Create_reminder_modal_confirm_action": "Save",
    "Create_reminder_modal_cancel_action": "Cancel",
  };

  static String getText(String key) {
    if (Settings.lang == "es") {
      return i18n._es[key]!;
    } else {
      return i18n._en[key]!;
    }
  }
}
