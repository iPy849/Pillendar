import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pillendar_app/navigation/navigation.dart';
import 'package:pillendar_app/theme/theme.dart';

void main() {
  initSettings();
  runApp(const MyApp());
}

void initSettings() {
  // TODO: Ajustar las variables globales como el idioma

  // Ajuste de orientación de pantalla
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Navigation.routes[0].path,
      routes: Navigation.getRoutes(context),
    );
  }
}
