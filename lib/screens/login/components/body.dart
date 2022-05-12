import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/login/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshers_hackathon/welcomeScreen.dart';
import 'package:freshers_hackathon/widgets/rounded_button.dart';
import 'package:freshers_hackathon/widgets/already_have_an_account.dart';
import 'package:freshers_hackathon/widgets/rounded_input_field.dart';
import 'package:freshers_hackathon/widgets/rounded_password_field.dart';
import 'package:freshers_hackathon/firebase/firebase_auth/auth.dart';
import 'package:freshers_hackathon/screens/signup/sign_up.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = true;
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
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
              text: "LOGIN",
              press: () async {
                print(emailController.text.toString());
                print(passwordController.text.toString());
                showDialog(
                  context: context,
                  builder: (ctx) => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                bool loggedIn = await auth.login(
                    emailController.text.toString(),
                    passwordController.text.toString());
                Navigator.pop(context);
                if (loggedIn) {
                  Navigator.pushNamed(context, welcomeScreen.id);
                  print("Logged In successfully");
                } else {
                  emailController.clear();
                  passwordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid Details'),
                    backgroundColor: Colors.black54,
                  ));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
