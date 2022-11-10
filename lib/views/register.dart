import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';

class RegisterView extends StatelessWidget with Utils {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkPrimary,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text(
          "Pantalla de registro",
          style: AppTextStyle.headingWhite_1,
        ),
      ),
    );
  }
}
