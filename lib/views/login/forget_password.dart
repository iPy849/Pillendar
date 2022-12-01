import 'package:flutter/material.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/index.dart';

class ForgotPasswordView extends StatelessWidget with Utils {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            hideKeyboard();
          },
          child: const CenterPanelWidget(
            child: ForgotPasswordForm(),
          ),
        ),
      ),
    );
  }
}
