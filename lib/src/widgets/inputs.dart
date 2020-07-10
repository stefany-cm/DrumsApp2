
import 'package:drumsapp2/src/services/user_provider.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mailInput(dynamic bloc) {
  return StreamBuilder(
    stream: bloc.mailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              labelText: 'Correo electrónico',
              hintText: 'ejemplo@correo.com',
              counterText: snapshot.data,
              errorText: snapshot.error),
          onChanged: (value) => bloc.changeMail(value),
        ),
      );
    },
  );
}

Widget passwordInput(dynamic bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline),
                //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ));
    },
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

Widget authCustomRaisedButton(dynamic bloc, String text) {
  return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text(
              text,
              style: textStyleButton,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 0.0,
          splashColor: blue2Color,
          color: blue2Color,
          textColor: Colors.black,
          // onPressed: _login1(bloc, context),
          onPressed: snapshot.hasData ? () => _auth(bloc, context) : null,
        );
      });
}

// customRaisedButton('Iniciar sesion', blue2Color, Colors.black,
//                 context, WelcomePage()),

_auth(dynamic bloc, BuildContext context) async {
  final servLogin = new UserProvider();
  // final servLogin = new Servicion();

  Map<String, dynamic> rest =
      await servLogin.auth(bloc.mail, bloc.password, context);

  // servLogin.createUser();
  print('================');
  print('Email: ${bloc.mail}');

  print('Password: ${bloc.password}');
  print('============');

  print('Respuesta de consulta: ${rest}');

  // Navigator.of(context).pushReplacementNamed('/signUpBasic');

  // Navigator.pushNamed(context, 'home');
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
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
