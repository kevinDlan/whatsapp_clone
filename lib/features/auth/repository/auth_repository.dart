import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/features/auth/screens/otp_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/auth/screens/user_information_screen.dart';
import 'dart:io';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            print(e.message);
            showSnackBar(context: context, content: "Something wrong");
          },
          codeSent: ((String verificationId, int? resentToken) async {
            Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: verificationId);
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseException catch (e) {
      print(e.message);
      showSnackBar(
          context: context, content: 'Something wrong, please try later.');
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      auth.signInWithCredential(credential).then((_) {
        Navigator.pushNamedAndRemoveUntil(
            context, UserInformationScreen.routeName, (route) => false);
      });
    } on FirebaseException catch (e) {
      print(e.message);
      showSnackBar(
          context: context, content: 'Something wrong, please try later.');
    }
  }

  void saveUserDataToFirebase(
      {required String name,
      required File? profile,
      required ProviderRef ref,
      required BuildContext context})
  {
     try{

     }catch(e)
    {
      print(e.toString());
      showSnackBar(context: context, content: "Something wrong");
    }
  }
}
