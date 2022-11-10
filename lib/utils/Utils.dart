import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin Utils {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void navigateToPath(String path, BuildContext context) {
    Navigator.pushNamed(context, path);
  }
}
