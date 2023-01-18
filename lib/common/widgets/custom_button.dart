import 'package:flutter/material.dart';
import 'package:whatsapp/constant/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.callback}) : super(key: key);
  final String text;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: const Size(double.infinity, 50)
      ),
      onPressed: callback,
      child: Text(
        text,
        style: const TextStyle(color: blackColor),
      ),
    );
  }
}
