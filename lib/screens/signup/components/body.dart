import 'package:flutter/material.dart';
import 'package:freshers_hackathon/screens/signup/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshers_hackathon/widgets/rounded_button.dart';
import 'package:freshers_hackathon/widgets/rounded_password_field.dart';
import 'package:freshers_hackathon/widgets/rounded_input_field.dart';
import 'package:freshers_hackathon/widgets/text_field_container.dart';
import 'package:freshers_hackathon/widgets/already_have_an_account.dart';
import 'package:freshers_hackathon/screens/signup/components/or_divider.dart';
import 'package:freshers_hackathon/screens/signup/components/social_icon.dart';


class Body extends StatelessWidget {
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
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );
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