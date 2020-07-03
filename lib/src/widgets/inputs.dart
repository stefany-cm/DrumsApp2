import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mailInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal:  20.0),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.alternate_email),
        labelText: 'Correo electrónico',
        hintText: 'ejemplo@correo.com'
      ),
    ),
  );
}

Widget passwordInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal:  20.0),
    child: TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
      icon: Icon(Icons.lock_outline),
      //suffixIcon: Icon(Icons.visibility_off), //Cambiar a statefulwidget
      labelText: 'Contraseña',
    ),
  )
  );
}
