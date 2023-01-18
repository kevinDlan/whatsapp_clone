import 'package:flutter/material.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';
import 'package:whatsapp/constant/color.dart';
import 'package:country_picker/country_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();

  Country? county;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
  }

  void pickCountry()
  {
    showCountryPicker(context: context, onSelect: (Country selectedCountry)
    {
        setState(() {
          county = selectedCountry;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('Enter your phone number'),
          backgroundColor: backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("WhatsApp will need to verify your phone number"),
                const SizedBox(height: 10),
                TextButton(onPressed: pickCountry, child: const Text('Pick Country')),
                Row(
                  children: [
                     if(county != null)
                       Text("+${county!.phoneCode}"),

                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          hintText: 'phone number',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.width * 0.6,
            ),
            SizedBox(
              width: 90,
                child: CustomButton(text: 'NEXT', callback: () {  },),
            )
          ],
        ),
      ),
    );
  }
}
