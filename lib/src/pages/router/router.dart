import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/pages/signUp_basic_page.dart';
import 'package:drumsapp2/src/pages/signUp_page.dart';
import 'package:drumsapp2/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> publicRoutes(BuildContext context) {
  return {
    "/": (context) => HomePage(),
    "/welcome": (context) => WelcomePage(),
    "/login": (context) => LoginPage(),
    "/signUp": (context) => SignUpPage(),
    "/signUpBasic": (context) => SignUpBasicPage(),
  };
}
