import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';

class ForgotPasswordView extends StatelessWidget with Utils {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text(
          "Perdí mi contraseña",
          style: AppTextStyle.headingWhite_1,
        ),
      ),
    );
  }
}
