import 'package:drumsapp2/src/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mailInput(LoginBloc bloc) {
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
            errorText: snapshot.error
          ),
          onChanged: (value) => bloc.changeMail(value),
        ),
      );
    },
  );
}

Widget passwordInput(LoginBloc bloc) {
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
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          )
        );
    },
  );
}
