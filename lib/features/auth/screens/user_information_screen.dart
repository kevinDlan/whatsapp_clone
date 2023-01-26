import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/constant/app_const.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);
  static const String routeName = "/user-information";

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController userNameController = TextEditingController();

  File? profileImage;

  void selectProfileImage() async {
    profileImage = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  profileImage == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(profile),
                          radius: 64,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(profileImage!),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectProfileImage,
                        icon: const Icon(Icons.add_a_photo),
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.done))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
