import 'package:amazaon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazaon_clone/routes/route_constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.authScreen:
      return MaterialPageRoute(builder: (_) {
        return const AuthScreen();
      });
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Error 404"),
                ),
              ));
  }
}
