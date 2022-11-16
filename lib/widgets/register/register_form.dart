import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/theme/index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with Utils {
  late String? password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(i18n.getText("Register_view_title"),
                style: AppTextStyle.heading_1),
          ),
          const SizedBox(
            height: AppStyleConstants.separation,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty || !EmailValidator.validate(v)) {
                return i18n.getText("Login_view_email_input_incorrect");
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: i18n.getText("Login_view_email_input_hint"),
              label: Text(
                i18n.getText("Login_view_email_input_label"),
                style: const TextStyle(color: AppColors.darkPrimary),
              ),
              icon: const Icon(
                Icons.email_outlined,
                color: AppColors.darkPrimary,
              ),
            ),
          ),
          TextFormField(
            validator: (v) {
              password = v;
              if (v == null || v.isEmpty) {
                return i18n.getText("Login_view_password_input_incorrect");
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: i18n.getText("Login_view_password_input_hint"),
              label: Text(
                i18n.getText("Login_view_password_input_label"),
                style: const TextStyle(color: AppColors.darkPrimary),
              ),
              icon: const Icon(
                Icons.password_outlined,
                color: AppColors.darkPrimary,
              ),
            ),
          ),
          TextFormField(
            validator: (v) {
              if (v == null || v.isEmpty || v != password) {
                return i18n
                    .getText("Register_view_repeat_password_input_incorrect");
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText:
                  i18n.getText("Register_view_repeat_password_input_hint"),
              label: Text(
                i18n.getText("Register_view_repeat_password_input_label"),
                style: const TextStyle(color: AppColors.darkPrimary),
              ),
              icon: const Icon(
                Icons.password_outlined,
                color: AppColors.darkPrimary,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: AppStyleConstants.separation),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Datos correctos')),
                  );
                }
                hideKeyboard();
              },
              child: Text(
                i18n.getText("Register_view_register_submit_button"),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => goToPreviosPath(context),
                  child: Text(
                    i18n.getText("Register_view_return_to_login"),
                    style: AppTextStyle.smallText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
