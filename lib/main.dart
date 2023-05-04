import 'package:amazaon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazaon_clone/routes/route_constants.dart';
import 'package:amazaon_clone/routes/router.dart';
import 'package:flutter/material.dart';

import 'constants/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amzaon Clone',
        theme: ThemeData(
            colorScheme:
                const ColorScheme.light(primary: GlobalVariable.secondaryColor),
            scaffoldBackgroundColor: GlobalVariable.backgroundColor,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            )),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const AuthScreen());
  }
}
