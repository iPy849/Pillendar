import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pillendar_app/navigation/route.dart';
import 'package:pillendar_app/views/index.dart';

class Navigation {
  static final List<RouteModel> routes = [
    RouteModel("/main", const MainView()),
    RouteModel("/login", const LoginView()),
    RouteModel("/register", const RegisterView()),
    RouteModel("/forgot_password", const ForgotPasswordView()),
  ];

  static getRoutes(BuildContext context) {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (RouteModel route in Navigation.routes) {
      routes.addAll({
        route.path: (context) => route.view,
      });
    }
    return routes;
  }
}
