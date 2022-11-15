import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/register/register_form.dart';

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
              child: const RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}
