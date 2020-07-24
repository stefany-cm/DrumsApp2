import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:drumsapp2/src/pages/router/router.dart';
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
    return Provider(
        child: MaterialApp(
            theme: customTheme(context),
            title: 'DrumsApp',
            debugShowCheckedModeBanner: false,
            routes: publicRoutes(context),
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                  builder: (BuildContext context) => HomePage());
            }
            // initialRoute: 'home',
            // routes: {
            //   'login': (BuildContext context) => LoginPage(),
            //   'login2': (BuildContext context) => LoginPage2(),
            //   'home': (BuildContext context) => WelcomePage(),
            //   'homeMenu': (BuildContext context) => WelcomeMenuPage(),
            //   'signUp': (BuildContext context) => SignUpPage(),
            // },
            ));
  }
}
/*import 'package:flutter/material.dart';

import 'package:sheet_music/sheet_music.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

// The existing imports
// !! Keep your existing impots here !!

/// main is entry point of Flutter application
void main() {
  // Desktop platforms aren't a valid platform.
  //_setTargetPlatformForDesktop();

  return runApp(MyApp());
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SheetMusic(
        scale: "C Major",
        pitch: "C4",
        trebleClef: true,
      ),
    );
  }
}*/
