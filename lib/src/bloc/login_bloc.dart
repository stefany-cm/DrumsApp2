import 'dart:async';

import 'package:drumsapp2/src/bloc/validators.dart';

class LoginBloc with Validators {

  final _mailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get mailStream => _mailController.stream.transform(mailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);

  //Insertar valores al Stream
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _mailController?.close();
    _passwordController?.close();
  }

}