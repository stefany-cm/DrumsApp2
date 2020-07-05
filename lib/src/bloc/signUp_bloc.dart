import 'dart:async';

import 'package:drumsapp2/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc with Validators {
  final _mailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();


  //Recupera los datos del Stream

  Stream<String> get mailStream => _mailController.stream.transform(mailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream.transform(passwordValidator).doOnData((String c){
      if (0 != _passwordController.value.compareTo(c)){
        _confirmPasswordController.addError("Las contraseñas no coinciden");
      }
    }); 

  Stream<bool> get formValidStream => Observable.combineLatest3(mailStream, passwordStream, _confirmPasswordController, (e, p, c) => (0 == p.compareTo(c)));



  //insertar valores al stream
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeConfirmPassword => _confirmPasswordController.sink.add;

//Obtener el ultimo valor ingresado a los streams
  String get mail => _mailController.value;
  String get password => _passwordController.value;
  String get confirpassword => _confirmPasswordController.value;

  dispose() {
    _mailController?.close();
    _passwordController?.close();
    _confirmPasswordController?.close();
  }
}
