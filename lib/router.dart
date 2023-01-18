import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';

import 'common/error.dart';

Route<dynamic> generateRoute(RouteSettings settings)
{
  switch(settings.name)
  {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default:
      return MaterialPageRoute(builder: (context)=> const Scaffold(
        body: ErrorScreen(error: 'This page doesn\'t exit'),
      ));
  }
}