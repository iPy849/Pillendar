import 'package:flutter/material.dart' show FocusManager;

mixin Utils {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
