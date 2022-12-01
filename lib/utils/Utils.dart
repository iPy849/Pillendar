// ignore_for_file: file_names
import 'package:flutter/material.dart';

mixin Utils {
  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void navigateToPath(String path, BuildContext context) {
    Navigator.pushNamed(context, path);
  }

  void replaceCurrentPath(String path, BuildContext context) {
    Navigator.pushReplacementNamed(context, path);
  }

  void goToPreviosPath(BuildContext context) {
    Navigator.pop(context);
  }
}
