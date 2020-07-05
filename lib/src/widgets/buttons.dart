import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/material.dart';

Widget customRaisedButton(String text, Color colorB, Color colorT,
    BuildContext context, dynamic route) {
  return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          text,
          style: textStyleButton,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      splashColor: blue2Color,
      color: colorB,
      textColor: colorT,
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => route,
            ));
      });
}

Widget customFlatButton(String text, Color colorB, Color colorBr, Color colorT,
    BuildContext context, dynamic route) {
  return FlatButton(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Text(text, style: textStyleButton)),
      color: colorB,
      splashColor: colorBr,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colorBr, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => route,
            ));
      });
}

Widget backIconButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 25.0),
    alignment: Alignment.bottomLeft,
    child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}

Widget textButton(
    String text, Color colorT, BuildContext context, dynamic route) {
  return FlatButton(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
          child: Text(text, style: textStyleShortBlue2)),
      splashColor: colorT,
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => route,
            ));
      });
}
