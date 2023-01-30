import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/constant/app_const.dart';
import 'package:whatsapp/features/auth/screens/otp_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/screens/mobile_screen_layout.dart';
import 'dart:io';

import '../../../common/repositories/common_firebase_storage_repositories.dart';

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
      //Navigator.pushNamedAndRemoveUntil(
      //    context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseException catch (e) {
      print(e.message);
      showSnackBar(
          context: context, content: 'Something wrong, please try later.');
    }
  }

  void saveUserDataToFirebase(
      {required String name,
      required File? profilePic,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = profile;
      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageProvider)
            .storeFileToFirebase("profilePic/$uid", profilePic);
      }

      UserModel user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          isOnline: true,
          userPhoneNumber: auth.currentUser!.phoneNumber!,
          groupId: []);

      firestore.collection("users").doc(uid).set(user.toMap()).then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MobileScreenLayout()),
            (route) => false);
      });
    } catch (e) {
      print(e.toString());
      showSnackBar(context: context, content: "Something wrong");
    }
  }

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Stream<UserModel> userData(String userId) {
    return firestore.collection("users").doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }
}
