import 'package:drumsapp2/src/pages/principal/homeNavigation_principal.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'logo.dart';

Widget customAppBar(String text, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: <Widget>[
      Expanded(
          flex: 10,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(gradient: blueLinearGColor),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.015),
                  backIconButton(context),
                  logoSize(context, 1, 0.2),
                  SizedBox(height: size.height * 0.015),
                  Text(text,
                      style: textStyleSemiBold, textAlign: TextAlign.center),
                  SizedBox(height: size.height * 0.015)
                ],
              )))
    ],
  );
}

Widget gradientAppBar(
    String text, LinearGradient colorL, BuildContext context) {
  return AppBar(
    title: Text(text, style: textStyleSemiBold),
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop()),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: colorL),
    ),
  );
}

Widget linearAppBar(String text, Color colorL, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // hides leading widget
    title: Text(text, style: textStyleSemiBold),
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop()),
    centerTitle: true,
    backgroundColor: colorL,
  );
}
Widget linearAppBarListExercises(String text, Color colorL, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // hides leading widget
    title: Text(text, style: textStyleSemiBold),
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => HomeNavigationPrincipal(),
            ))),
    centerTitle: true,
    backgroundColor: colorL,
  );
}
Widget linearAppBarTheory(String text, Color colorL, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // hides leading widget
    title: Text(text, style: textStyleSemiBold),
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => HomeNavigationPrincipal(),
            ))),
    centerTitle: true,
    backgroundColor: colorL,
  );
}

Widget linearAppBarActions(
    String text, Color colorL, BuildContext context, List<Widget> act) {
  return AppBar(
      automaticallyImplyLeading: false, // hides leading widget
      title: Text(text, style: textStyleSemiBold),
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop()),
      centerTitle: true,
      backgroundColor: colorL,
      actions: act);
}
