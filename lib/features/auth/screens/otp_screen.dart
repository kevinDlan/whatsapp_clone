import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);
  static const String routeName = "/otp-screen";
  final String verificationId;

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('Verifying your number'),
          backgroundColor: backgroundColor),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'We have send you a sms with code',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(fontSize: 30),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if (val.length == 6) {
                    verifyOTP(ref, context, val.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
