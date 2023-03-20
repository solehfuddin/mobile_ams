import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_ams/routes/routes.dart';
import 'package:mobile_ams/services/services.dart';
import 'views/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
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
      // home: DetailVisitingScreen(),
      onGenerateRoute: NavigationGenerator.generateRoute,
    );
  }
}
