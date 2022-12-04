import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/firebase_auth_controller.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with Utils {
  late String emailValue;
  late String password;
  final _formKey = GlobalKey<FormState>();

  void loginLogic(BuildContext context) {
    FirebaseAuthController firebaseAuthController =
        Provider.of<FirebaseAuthController>(context, listen: false);
    // Llamada de autenticación
    firebaseAuthController.firebaseAuthenticate(emailValue, password).then(
      (user) {
        if (user == null) {
          showToast(context, i18n.getText("Login_view_auth_error_toast"));
          return;
        }
        replaceCurrentPath("/main", context);
      },
    );

    hideKeyboard();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: [
          Center(
            // child: Text(i18n.getText("Login_view_title"),
            //     style: AppTextStyle.headingWhite_1),
            child: Image.asset(
              "assets/pillendar_logo.png",
              width: 100,
              height: 100,
              color: AppColors.darkerPrimary,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: AppStyleConstants.separation,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              emailValue = v ?? "";
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
              password = v ?? "";
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
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: AppStyleConstants.separation),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  loginLogic(context);
                }
              },
              child: Text(
                i18n.getText("Login_view_login_submit_button"),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => navigateToPath("/register", context),
                  child: Text(
                    i18n.getText("Login_view_create_new_profile_button"),
                    style: AppTextStyle.smallText,
                  ),
                ),
                TextButton(
                  onPressed: () => navigateToPath("/forgot_password", context),
                  child: Text(
                    i18n.getText("Login_view_forget_password_button"),
                    style: AppTextStyle.smallText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppStyleConstants.separation),
            child: Text(i18n.getText("Login_view_socials_login_title"),
                style: AppTextStyle.heading_3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                ),
                child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(i18n.getText("Development_mesaje")),
                        ),
                      );
                    },
                    icon: SvgPicture.asset("assets/facebook_logo.svg"),
                    label: const Text("Facebook")),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(i18n.getText("Development_mesaje")),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                ),
                child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(i18n.getText("Development_mesaje")),
                        ),
                      );
                    },
                    icon: SvgPicture.asset("assets/google_logo.svg"),
                    label: const Text("Google")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
