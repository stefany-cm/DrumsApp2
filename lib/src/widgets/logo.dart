
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:flutter/material.dart';

Widget logo(BuildContext context) {
  final imageLogo = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: new BoxDecoration(
        gradient: null,
        image: new DecorationImage(
          image: ExactAssetImage('assets/logo.png'),
        ),
      ));
  return imageLogo;
}

Widget logoSize(BuildContext context, double w, double h) {
  final imageLogo = Container(
      width: MediaQuery.of(context).size.width * w,
      height: MediaQuery.of(context).size.height * h,
      decoration: new BoxDecoration(
        gradient: null,
        image: new DecorationImage(
          image: ExactAssetImage('assets/logo.png'),
        ),
      ));
  return imageLogo;
}

Widget logoContainerRounded(BuildContext context) {
  return Container(
    child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(250.0, 120.0),
              bottomLeft: Radius.elliptical(250.0, 120.0)),
          gradient: blueLinearGColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          image: new DecorationImage(
            image: ExactAssetImage('assets/logo.png'),
          ),
        )),
  );
}