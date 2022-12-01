import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/firebase_options.dart';
import 'package:pillendar_app/navigation/navigation.dart';
import 'package:pillendar_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeFlutterAppSettings();
  runApp(const MyApp());
}

initializeFlutterAppSettings() async {
  // NOTE: Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ajuste de orientación de pantalla
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Widget createApp(BuildContext context) {
  return MaterialApp(
    theme: AppTheme().getTheme(),
    debugShowCheckedModeBanner: false,
    initialRoute: Navigation.routes[1].path,
    routes: Navigation.getRoutes(context),
  );
}

Widget providers(Widget childWidget) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<FirebaseAuthController>(
        create: (_) {
          return FirebaseAuthController.getInstance();
        },
      ),
    ],
    child: childWidget,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return providers(
      createApp(context),
    );
  }
}
