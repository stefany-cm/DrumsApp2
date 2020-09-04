import 'package:drumsapp2/src/controllers/home_controller.dart';
import 'package:drumsapp2/src/pages/home_page.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/pages/principal/homeNavigation_principal.dart';
// import 'package:drumsapp2/src/pages/principal/modules/modules_principal.dart';
import 'package:drumsapp2/src/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   Future.delayed(Duration(seconds: 2), () {
  //     Get.off(HomePage(), transition: Transition.zoom);
  //   });
  // }

  String _email = '';
  String _password = '';
  String _confipassword = '';

  void onInputPassword(String passwordInput) {
    this._password = passwordInput;
    print("object" + passwordInput);
  }

  void onInputEmail(String emailInput) {
    this._email = emailInput;
    print("object" + _email.toString());
  }

  void onInputCofirtPassword(String confipassword) {
    this._confipassword = confipassword;
    print("object" + _confipassword.toString());
  }

  void goDataLogin() async {
    if (this._email.trim().length > 0 && this._password.trim().length > 0) {
      // Get.back();

      if (this._password == this._confipassword) {
        final servLogin = new UserProvider();
        // final servLogin = new Servicion();
        Map<String, dynamic> rest =
            await servLogin.createUser2(_email, _password);

        print('================');
        print('Email: ${_email}');
        print('Password: ${_password}');
        print('============');
        print('Respuesta de consulta: ${rest}');
        print('Respuesta de mesaje: ${rest['mensaje']}');

        // Navigator.of(context).pushReplacementNamed('/signUpBasic');
        if (rest['mensaje'] == "si") {
          // Navigator.of(context).pushReplacementNamed('/homeNavigation');
          Get.dialog(AlertDialog(
            title: Text("Felicitaciones  "),
            content: Text("Tu usuario ha sido creado exitosamente :D "),
            actions: <Widget>[
              FlatButton(
                child: Text('Approve'),
                onPressed: () {
                  Get.off(LoginPage());
                },
              ),
            ],
          ));

          // Get.off(LoginPage());
          print('deberia enviar Login? ');
        } else {
          Get.dialog(AlertDialog(
            title: Text("ERROR "),
            content: Text("No se pudo registrar "),
          ));
        }
      } else {
        Get.dialog(AlertDialog(
          title: Text("ERROR "),
          content: Text("Las contraseñas no coiciden "),
        ));
      }
    } else {
      Get.dialog(AlertDialog(
        title: Text("error "),
        content: Text("ingrese algo pendejo"),
      ));
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose

    print("on Close");
    super.onClose();
  }
}
