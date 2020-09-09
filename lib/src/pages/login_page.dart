import 'package:drumsapp2/src/controllers/login_controller.dart';
import 'package:drumsapp2/src/pages/signUp_page.dart';
import 'package:drumsapp2/src/pages/welcome_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/inputs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: Stack(
                children: <Widget>[
                  customAppBar('Inicio de sesión', context),
                  _loginForm(context)
                ],
              ),
            ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) => SingleChildScrollView(
                child: Column(children: <Widget>[
              SafeArea(
                child: Container(
                  height: 80.0,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height*0.62,
                  margin: EdgeInsets.only(top: size.height * 0.23),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      // SizedBox(height: 5.0),
                      mailInput(),
                      SizedBox(height: 20.0),
                      passwordInput(),
                      _forgetPassword(context),
                      SizedBox(height: 30.0),
                      authCustomRaisedButton('Iniciar sesión'),
                      SizedBox(height: 45.0),
                      _noAccountYet(context)
                    ],
                  ),
                ),
              ),
            ])));
  }

  Widget _forgetPassword(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: textButton(
            '¿Contraseña olvidada?', blue2Color, context, WelcomePage()));
  }

  Widget _noAccountYet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Aún no tiene una cuenta?',
          style: textStyleShortBlack,
        ),
        textButton('Registrarse', blue2Color, context, SignUpPage()),
        // textButton('Registrarse', blue2Color, context,
        //     Navigator.of(context).pushReplacementNamed('/signU'))
      ],
    );
  }

  // Widget _noAccountYet2(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text(
  //         '¿Aún no tiene una cuenta?',
  //         style: textStyleShortBlack,
  //       ),
  //       textButton('Registrarse2', blue2Color, context, SignUpPersonalPage()),
  //     ],
  //   );
  // }
}
