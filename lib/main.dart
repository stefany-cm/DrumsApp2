// import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/pages/home_page.dart';
// import 'package:drumsapp2/src/services/TheoryInfo.dart';
import 'package:drumsapp2/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:drumsapp2/src/pages/router/router.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: customTheme(context),
        title: 'DrumsApp',
        debugShowCheckedModeBanner: false,
        routes: publicRoutes(context),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        });
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         builder: (context) => TheoryInfo(),
//         child: MaterialApp(
//             theme: customTheme(context),
//             title: 'DrumsApp',
//             debugShowCheckedModeBanner: false,
//             routes: publicRoutes(context),
//             initialRoute: '/',
//             onGenerateRoute: (RouteSettings settings) {
//               return MaterialPageRoute(
//                   builder: (BuildContext context) => HomePage());
//             }));
//   }
// }
