import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/login/login_screen.dart';
import 'package:freshers_hackathon/screens/signup/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshers_hackathon/widgets/rounded_button.dart';
import 'package:freshers_hackathon/widgets/rounded_password_field.dart';
import 'package:freshers_hackathon/widgets/rounded_input_field.dart';
import 'package:freshers_hackathon/widgets/text_field_container.dart';
import 'package:freshers_hackathon/widgets/already_have_an_account.dart';
import 'package:freshers_hackathon/screens/signup/components/or_divider.dart';
import 'package:freshers_hackathon/screens/signup/components/social_icon.dart';
import 'package:freshers_hackathon/firebase/firebase_auth/auth.dart';
import 'package:freshers_hackathon/welcomeScreen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth auth = Auth();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
              controller: emailController,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: passwordController,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                showDialog(
                  context: context,
                  builder: (ctx) => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                bool SignedIn = await auth.signup(
                    emailController.text.toString().trim(),
                    passwordController.text.toString().trim());
                Navigator.pop(context);
                if (SignedIn) {
                  //Navigate to main Screen
                  Navigator.pushNamed(context, welcomeScreen.id);
                  print("User Data Save succesfully");
                } else {
                  emailController.clear();
                  passwordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Sign Up Failed!! Try Again',
                    ),
                    backgroundColor: Colors.black54,
                  ));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
