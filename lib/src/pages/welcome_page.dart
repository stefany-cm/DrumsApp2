import 'package:drumsapp2/src/pages/signUp_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/logo.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            logoContainerRounded(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            customFlatButton('Registrarse', null, blue2Color, Colors.black, context, "/signUp"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // customRaisedButton('Iniciar sesión', blue2Color, Colors.black, context, LoginPage()),
            customRaisedButton(
                'Iniciar sesión', blue2Color, Colors.black, context, "/listRhythms"),
          ],
        ),
      ),
    );
  }
}
