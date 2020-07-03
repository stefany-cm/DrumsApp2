import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(context),
      title: 'DrumsApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // initialRoute: 'home',
      // routes: {
      //   'login': (BuildContext context) => LoginPage(),
      //   'login2': (BuildContext context) => LoginPage2(),
      //   'home': (BuildContext context) => WelcomePage(),
      //   'homeMenu': (BuildContext context) => WelcomeMenuPage(),
      //   'signUp': (BuildContext context) => SignUpPage(),
      // },
    );
  }
}
