import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/pages/principal/homeNavigation_principal.dart';
import 'package:drumsapp2/src/pages/rhythms/list_rhythms.dart';
import 'package:drumsapp2/src/pages/signUpPersonal_page.dart';
import 'package:drumsapp2/src/pages/signUp_page.dart';
import 'package:drumsapp2/src/pages/welcome_page.dart';
import 'package:drumsapp2/src/pages/principal/group_principal.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> publicRoutes(BuildContext context) {
  return {
    "/": (context) => HomePage(),
    "/welcome": (context) => WelcomePage(),
    "/login": (context) => LoginPage(),
    "/signUp": (context) => SignUpPage(),
    "/signUpPersonal": (context) => SignUpPersonalPage(),
    "/homeNavigation": (context) => HomeNavigationPrincipal(),
    "/groupPricipal": (context) => GroupPrincipal(),
    "/listRhythms": (context) => ListRhythms(),
    // "/modulesPrincipal": (context) => ModulesPrincipal(),//
    // "/hom": (context) => HomeNavigationPrincipal(),
  };
}
