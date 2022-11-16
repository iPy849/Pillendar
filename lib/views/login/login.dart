import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/index.dart';

class LoginView extends StatelessWidget with Utils, FirebaseAuthController {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        child: const CenterPanelWidget(
          child: LoginForm(),
        ),
      ),
    );
  }
}
