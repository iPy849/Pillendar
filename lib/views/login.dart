import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/theme.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/login/login_form.dart';

class LoginView extends StatelessWidget with Utils {
  const LoginView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPrimary,
      body: GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        child: Container(
          // Contenedor externo
          margin: const EdgeInsets.all(AppStyleConstants.separation),
          // Acomodar al centro
          child: Center(
            // Caja de formulario
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppStyleConstants.cornerRadius),
                ),
              ),
              padding: const EdgeInsets.all(AppStyleConstants.separation),
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
