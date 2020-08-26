import 'package:drumsapp2/src/controllers/login_controller.dart';
import 'package:drumsapp2/src/services/user_provider.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mailInput() {
  return GetBuilder<LoginController>(
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email),
          labelText: 'Correo electrónico',
          hintText: 'ejemplo@correo.com',

          // counterText: snapshot.data,
          // errorText:
          //
        ),
        onChanged: _.onInputEmail,
        // onChanged: (value) => bloc.changeMail(value),
      ),
    ),
  );
}

Widget passwordInput() {
  return GetBuilder<LoginController>(
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
          labelText: 'Contraseña',
        ),
        onChanged: _.onInputPassword,
      ),
    ),
  );
}

Widget passwordConfimationInput(dynamic bloc) {
  return StreamBuilder(
    stream: bloc.confirmPasswordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.check_circle_outline),
                //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
                labelText: 'Confirmar contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeConfirmPassword,
          ));
    },
  );
}

Widget authCustomRaisedButton(String text) {
  return GetBuilder<LoginController>(
      builder: (_) => RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Text(
                text,
                style: textStyleButton,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 0.0,
            splashColor: blue2Color,
            color: blue2Color,
            textColor: Colors.black,
            // onPressed: _login1(bloc, context),
            // onPressed: snapshot.hasData ? () => _auth(context) : null,
            onPressed: _.goDataLogin,
          ));
}

// customRaisedButton('Iniciar sesion', blue2Color, Colors.black,
//                 context, WelcomePage()),

_auth(BuildContext context) async {
  final servLogin = new UserProvider();
  // // final servLogin = new Servicion();
  // // Map<String, dynamic> rest =
  // //     await servLogin.auth(bloc.mail, bloc.password, context);

  // print('================');
  // print('Email: ${bloc.mail}');
  // print('Password: ${bloc.password}');
  //   print('============');
  // print('Respuesta de consulta: ${rest}');
  // print('Respuesta de mesaje: ${rest['mensaje']}');

  // // Navigator.of(context).pushReplacementNamed('/signUpBasic');
  // if (rest['mensaje'] == "si") {
  //   Navigator.of(context).pushReplacementNamed('/homeNavigation');
  // } else {
  //   _showMyDialog(context);
  // }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alerta'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('El usuario no existe.'),
              Text('Si desea registrase en la parte inferior esta la opcion'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
