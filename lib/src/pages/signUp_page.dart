import 'package:drumsapp2/src/bloc/provider.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';

// import 'package:drumsapp2/src/widgets/inputs.dart';
import 'package:drumsapp2/src/widgets/inputsSignUp.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          customAppBar('Registro', context),
          _singUpForm(context)
        ],
      ),
    );
  }

  Widget _singUpForm(BuildContext context) {
    final bloc = Provider.ofS(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
      SafeArea(child: Container(height: 80.0)),
      Container(
        width: size.width,
        height: size.height*0.7,
        margin: EdgeInsets.only(top: size.height * 0.23),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height*0.05),
            mailInput(bloc),
            SizedBox(height: size.height*0.020),
            passwordInput(bloc),
            SizedBox(height: size.height*0.030),
            passwordConfimationInput(bloc),
            SizedBox(height: size.height*0.025),
            authCustomRaisedButton(bloc, 'Registrarse'),
            SizedBox(height: size.height*0.040),
            _accountCreated(context),
          ],
        ),
      ),
    ]));
  }
  Widget _accountCreated(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Ya tiene una cuenta?',
          style: textStyleShortBlack,
        ),
        textButton('Iniciar sesión', blue2Color, context, LoginPage()),
      ],
    );
  }
}
