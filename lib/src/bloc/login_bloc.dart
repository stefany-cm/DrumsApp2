import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:drumsapp2/src/bloc/validators.dart';
import 'package:flutter/foundation.dart';

class LoginBloc with Validators {
  final _mailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get mailStream =>
      _mailController.stream.transform(mailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(mailStream, passwordStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get mail => _mailController.value;
  String get password => _passwordController.value;

  dispose() {
    _mailController?.close();
    _passwordController?.close();
  }
}
