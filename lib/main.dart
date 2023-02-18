import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_ams/routes/routes.dart';
import 'package:mobile_ams/services/services.dart';
import 'views/pages/pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final session = SessionServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: session.readSplashSession()
          ? session.isLoginSession()
              ? DashboardScreen(
                  user: session.readUserSession(),
                )
              : const LoginScreen()
          : SplashScreen(),
      onGenerateRoute: NavigationGenerator.generateRoute,
    );
  }
}
