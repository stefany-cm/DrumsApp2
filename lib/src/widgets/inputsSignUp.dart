// import 'package:drumsapp2/src/bloc/login_bloc.dart';
// import 'package:drumsapp2/src/services/provider.dart';

import 'package:drumsapp2/src/controllers/signUp_controller.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

Widget mailInput() {
  return GetBuilder<SignUpController>(
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
  return GetBuilder<SignUpController>(
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
          labelText: 'Contraseña',
          // counterText: snapshot.data,
          // errorText: snapshot.error
        ),
        onChanged: _.onInputPassword,
      ),
    ),
  );
}

Widget passwordConfimationInput() {
  return GetBuilder<SignUpController>(
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.check_circle_outline),
          //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
          labelText: 'Confirmar contraseña',
          // counterText: snapshot.data,
          // errorText: snapshot.error
        ),
        onChanged: _.onInputCofirtPassword,
      ),
    ),
  );
}

Widget authCustomRaisedButton(String text) {
  return GetBuilder<SignUpController>(
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
            // onPressed: snapshot.hasData ? () => _createUser(context) : null,
            onPressed: _.goDataLogin,
          ));
}

// customRaisedButton('Iniciar sesion', blue2Color, Colors.black,
//                 context, WelcomePage()),

_createUser(BuildContext context) async {
  // final servLogin = new UserProvider();
  // Map<String, dynamic> rest =
  //     await servLogin.createUser2(bloc.mail, bloc.password);

  // // servLogin.createUser();
  // print('================');
  // print('Email: ${bloc.mail}');

  // print('Password: ${bloc.password}');
  // print('============');

  // print('Respuesta de consulta: ${rest}');
  // if (rest['mensaje'] == "si") {
  //   Navigator.of(context).pushReplacementNamed('/login');
  //   _showMyDialog2(context);
  // } else {
  //   _showMyDialog2(context);
  // }
}

Future<void> _showMyDialog1(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alerta '),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Se ha presentado un error '),
              Text('Vuelvelo a intentar mas tarde '),
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

Future<void> _showMyDialog2(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(' :D '),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Su usuario ha sido creado.'),
              Text('Ahora puedes ingresar '),
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
