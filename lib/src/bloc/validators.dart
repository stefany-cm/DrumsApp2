import 'dart:async';

class Validators {

  final mailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: ( mail, sink ) {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(mail)) {
        sink.add( mail );
      } else {
        sink.addError('Correo electrónico incorrecto');
      }
    }
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {
      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }
    }
  );
  
}