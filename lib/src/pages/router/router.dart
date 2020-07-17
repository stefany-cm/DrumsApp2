import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/pages/principal/homeNavigation_principal.dart';
import 'package:drumsapp2/src/pages/principal/modules/compositions/list_compositions.dart';
import 'package:drumsapp2/src/pages/principal/modules/exercises/list_exercises.dart';
import 'package:drumsapp2/src/pages/principal/modules/rhythms/balada_rhythms.dart';
import 'package:drumsapp2/src/pages/principal/modules/rhythms/list_rhythms.dart';
import 'package:drumsapp2/src/pages/principal/modules/teory/list_Teory.dart';
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
    "/listTeory": (context) => ListTeory(),
    "/listExercises": (context) => ListExercises(),
    "/listRhythms": (context) => ListRhythms(),
    "/listComposition": (context) => ListComposition(),
    "/BaladaRhythms": (context) => BaladaRhythms(),
    // "/modulesPrincipal": (context) => ModulesPrincipal(),//
    // "/hom": (context) => HomeNavigationPrincipal(),
  };
}
