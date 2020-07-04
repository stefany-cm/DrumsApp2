import 'package:drumsapp2/src/pages/welcome_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'logo.dart';

Widget customAppBar(String text, BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      
      decoration: BoxDecoration(gradient: blueLinearGColor),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          backIconButton(context),
          logoSize(context, 1, 0.2),
          SizedBox(height: 15.0),
          Text(text, style: textStyleSemiBold, textAlign: TextAlign.center),
          SizedBox(height: 15.0)
        ],
      ));
}
