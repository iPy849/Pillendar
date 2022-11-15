// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin Utils {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void navigateToPath(String path, BuildContext context) {
    Navigator.pushNamed(context, path);
  }

  void goToPreviosPath(BuildContext context) {
    Navigator.pop(context);
  }
}
