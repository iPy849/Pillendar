import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<ForgotPasswordForm> with Utils {
  final _formKey = GlobalKey<FormState>();
  String? email;

  sendMail(BuildContext context) {
    hideKeyboard();
    _formKey.currentState?.reset();
    FirebaseAuthController firebaseAuthController =
        Provider.of<FirebaseAuthController>(context, listen: false);

    firebaseAuthController.firebaseForgotPassword(email!).then(
      (value) {
        String message = !value
            ? i18n.getText("Forgot_password_view_auth_error_toast")
            : i18n.getText("Forgot_password_view_auth_success_toast");
        showToast(context, message);
      },
    );
  }

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
            child: Text(i18n.getText("Forgot_password_view_title"),
                style: AppTextStyle.heading_1),
          ),
          const SizedBox(
            height: AppStyleConstants.separation,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              email = v;
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
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: AppStyleConstants.separation),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendMail(context);
                }
              },
              child: Text(
                i18n.getText("Forgot_password_view_submit_button"),
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
