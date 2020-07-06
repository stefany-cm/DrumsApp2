import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/pages/signUp_basic_page.dart';
import 'package:drumsapp2/src/pages/signUp_page.dart';
import 'package:drumsapp2/src/pages/welcome_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/inputs.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          customAppBar('Inicio de sesión', context),
          _loginForm(context)
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.ofL(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      SafeArea(
        child: Container(
          height: 80.0,
        ),
      ),
      Container(
        width: size.width,
        margin: EdgeInsets.only(top: size.height * 0.23),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            mailInput(bloc),
            SizedBox(height: 20.0),
            passwordInput(bloc),
            _forgetPassword(context),
            SizedBox(height: 30.0),
            // customRaisedButton('Iniciar sesion', blue2Color, Colors.black,
            //     context, WelcomePage()),

            //authCustomRaisedButton(bloc, 'Iniciar sesión'),
//             SizedBox(height: 45.0),
//             _noAccountYet(context)
              authCustomRaisedButton(bloc, 'Iniciar sesión'),
            SizedBox(height: 45.0),
            _noAccountYet(context),
            _noAccountYet2(context)

          ],
        ),
      ),
    ]));
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
      ],
    );
  }

  Widget _noAccountYet2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Aún no tiene una cuenta?',
          style: textStyleShortBlack,
        ),
        textButton('Registrarse2', blue2Color, context, SignUpBasicPage()),
      ],
    );
  }
}
