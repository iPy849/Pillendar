import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/firebase_auth_controller.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/index.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with Utils {
  bool showView = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseAuthController firebaseAuthController =
          Provider.of<FirebaseAuthController>(context, listen: false);
      if (firebaseAuthController.firebaseAuthInstance.currentUser != null) {
        // replaceCurrentPath("/main", context);
        setState(() {
          showView = true;
        });
      } else {
        setState(() {
          showView = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showView) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              hideKeyboard();
            },
            child: const CenterPanelWidget(
              child: LoginForm(),
            ),
          ),
        ),
      );
    } else {
      return const LoadingScreen();
    }
  }
}
