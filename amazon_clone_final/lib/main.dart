import 'package:amazon_clone_final/router.dart';
import 'package:flutter/material.dart';
import 'constants/global_variables.dart';
import 'features/auth/screens/auth_screen.dart';

enum Auth{
  signin,
  signup,
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary:GlobalVariables.secondaryColor,
        ),
        appBarTheme:const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black),
           ),
          ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  const AuthScreen(),
    );
  }

}

