import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcome_screen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
