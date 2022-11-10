import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/utils/Utils.dart';

import '../../theme/theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with Utils {
  late String emailValue;
  late String password;
  final _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
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
            child: Text(i18n.getText("Login_view_title"),
                style: AppTextStyle.headingWhite_1),
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
              if (v == null || v.isEmpty) {
                return i18n.getText("Login_view_password_input_incorrect");
              }
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                hideKeyboard();
              },
              child: Text(
                i18n.getText("Login_view_login_submit_button"),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              i18n.getText("Login_view_create_new_profile_button"),
              style: AppTextStyle.smallText,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              i18n.getText("Login_view_forget_password_button"),
              style: AppTextStyle.smallText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(i18n.getText("Development_mesaje")),
                    ),
                  );
                },
                icon: SvgPicture.asset("assets/facebook_logo.svg"),
                padding: EdgeInsets.zero,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/google_logo.svg"),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
