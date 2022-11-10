import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/theme.dart';
import 'package:pillendar_app/views/login.dart';

void main() {
  initSettings();
  runApp(const MyApp());
}

void initSettings() {
  // TODO: Ajustar las variables globales como el idioma
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: const LoginView(title: 'Pillendar'),
    );
  }
}
