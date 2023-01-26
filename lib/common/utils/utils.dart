import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> pickImageFromGallery( BuildContext context) async
{
  File? image;
  try
      {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(pickedImage != null)
          {
            image = File(pickedImage.path);
          }
      } catch(e)
     {
        print(e.toString());
        showSnackBar(context: context, content: "Something wrong");
     }

     return image;
}
