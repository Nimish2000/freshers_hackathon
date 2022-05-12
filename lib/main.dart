import 'package:flutter/material.dart';
import 'package:freshers_hackathon/welcomeScreen.dart';
import 'task_status.dart';
import 'registrationScreen.dart';
import 'loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshers_hackathon/screens/welcome/welcome_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Freshers Admin';
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: appTitle,
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context)=> WelcomeScreen(),
      },
    );
  }
}

