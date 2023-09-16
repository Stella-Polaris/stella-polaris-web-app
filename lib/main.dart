
import 'package:flutter/material.dart';
import 'package:stella_polaris/pages/login.dart';
import 'package:stella_polaris/theme/color_schemes.dart';

import 'navigation/route_generator.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorScheme: StellaPolarisTheme.lightColorScheme),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: StellaPolarisTheme.darkColorScheme),
      title: 'My Team Manager',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const Login()
    );
  }
}
