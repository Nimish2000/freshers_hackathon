import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/signup/sign_up.dart';
import 'package:freshers_hackathon/welcomeScreen.dart';
import 'task_status.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshers_hackathon/screens/welcome/welcome_screen.dart';
import 'constants.dart';
import 'package:freshers_hackathon/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: "Welcome",
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        welcomeScreen.id: (context) => welcomeScreen(),
      },
    );
  }
}
