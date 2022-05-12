import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshers_hackathon/constants.dart';
import 'package:freshers_hackathon/widgets/rounded_button.dart';
import 'package:freshers_hackathon/screens/login/login_screen.dart';
import 'package:freshers_hackathon/screens/signup/sign_up.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Login",
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "SignUp",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}