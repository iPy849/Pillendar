import 'package:flutter/material.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/index.dart';

class RegisterView extends StatelessWidget with Utils {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        child: const CenterPanelWidget(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
