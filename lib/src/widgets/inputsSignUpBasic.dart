
import 'package:drumsapp2/src/services/user_provider.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

Widget nameInput(dynamic bloc) {
  return StreamBuilder(
    stream: bloc.mailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              labelText: 'Nombre Completo',
              hintText: 'Juanito alcachofa',
              counterText: snapshot.data,
              errorText: snapshot.error),
          onChanged: (value) => bloc.changeMail(value),
        ),
      );
    },
  );
}

// Widget dateInput(dynamic bloc) {
//   return StreamBuilder(
//     stream: bloc.passwordStream,
//     builder: (BuildContext context, AsyncSnapshot snapshot) {
//       return Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: TextFormField(
//             obscureText: true,
//             decoration: InputDecoration(
//                 icon: Icon(Icons.lock_outline),
//                 //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
//                 labelText: 'Fecha de nacimiento',
//                 counterText: snapshot.data,
//                 errorText: snapshot.error),
//             onChanged: bloc.changePassword,
//           ));
//     },
//   );
// }

Widget genreInput(dynamic bloc) {
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
                labelText: 'Genero',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeConfirmPassword,
          ));
    },
  );
}

Widget createCustomRaisedButton(dynamic bloc, String text) {
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
          onPressed: snapshot.hasData ? () => _createUser(bloc, context) : null,
        );
      });
}

// customRaisedButton('Iniciar sesion', blue2Color, Colors.black,
//                 context, WelcomePage()),

_createUser(dynamic bloc, BuildContext context) async {
  final servLogin = new UserProvider();
  Map<String, dynamic> rest =
      await servLogin.createUser2(bloc.mail, bloc.password);

  // servLogin.createUser();
  print('================');
  print('Email: ${bloc.mail}');

  print('Password: ${bloc.password}');
  print('============');

  print('Respuesta de consulta: ${rest}');

  // Navigator.pushNamed(context, 'home');
}

Widget datePruebaInput(dynamic bloc) {
  DateTime selectedData;
  return StreamBuilder(
    stream: bloc.confirmPasswordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return DateField(
        onDateSelected: (DateTime value) {
          // setState(() {
          //   selectedData = value;
          // });
        },
        decoration: InputDecoration(border: OutlineInputBorder()),
        label: 'My date field',
        // dateFormat: DateFormat.yMd(),
        selectedDate: selectedData,
      );
      ;
    },
  );
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
