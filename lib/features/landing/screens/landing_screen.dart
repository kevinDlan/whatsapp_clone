import 'package:flutter/material.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);


  void navigateToLoginScreen(BuildContext context)
  {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Welcome To Whatsapp",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/images/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read ours Privacy Policies. Tap, "Agree and Continue" to Accept the Terms of service',
                style: TextStyle(
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  callback: () => navigateToLoginScreen(context),
                ))
          ],
        ),
      ),
    );
  }
}
