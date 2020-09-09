import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/textStyle_utils.dart';

Widget gradientAppBar(String text, LinearGradient colorL, BuildContext context) {
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
Widget gradientAppBarPrincipal(String text, LinearGradient colorL, BuildContext context) {
  return AppBar(
    title: Text(text, style: textStyleSemiBold),
    centerTitle: true,
    leading: SizedBox(height: 0),
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: colorL),
    ),
  );
}
