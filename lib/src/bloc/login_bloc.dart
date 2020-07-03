import 'dart:async';

class LoginBloc {

  final _mailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get mailStream => _mailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //Insertar valores al Stream
  Function(String) get changeMail => _mailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _mailController?.close();
    _passwordController?.close();
  }

}