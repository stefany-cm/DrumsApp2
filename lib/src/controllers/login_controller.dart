import 'package:drumsapp2/src/pages/principal/homeNavigation_principal.dart';
// import 'package:drumsapp2/src/pages/principal/modules/modules_principal.dart';
import 'package:drumsapp2/src/services/user_provider.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   Future.delayed(Duration(seconds: 2), () {
  //     Get.off(HomePage(), transition: Transition.zoom);
  //   });
  // }

  String _email = '';
  String _password = '';

  void onInputPassword(String passwordInput) {
    this._password = passwordInput;
    print("object" + passwordInput);
  }

  void onInputEmail(String emailInput) {
    this._email = emailInput;
    print("object" + _email.toString());
  }

  void goDataLogin() async {
    if (this._email.trim().length > 0 && this._password.trim().length > 0) {
      // Get.back();
      final servLogin = new UserProvider();
      // final servLogin = new Servicion();
      Map<String, dynamic> rest = await servLogin.auth(_email, _password);

      print('================');
      print('Email: ${_email}');
      print('Password: ${_password}');
      print('============');
      print('Respuesta de consulta: ${rest}');
      print('Respuesta de mesaje: ${rest['mensaje']}');

      // Navigator.of(context).pushReplacementNamed('/signUpBasic');
      if (rest['mensaje'] == "si") {
        // Navigator.of(context).pushReplacementNamed('/homeNavigation');
        Get.off(HomeNavigationPrincipal());
        print('deberia enviar Modules principal? ');
      } else {
        Get.dialog(showAlertDialogOneAction("Algo salió mal", "Si desea registrase en la parte inferior esta la opcion", Icons.info, blue1Color));
        /*Get.dialog(AlertDialog(
          title: Text("ERROR "),
          content:
              Text("Si desea registrase en la parte inferior esta la opcion"),
        ));*/
      }
    } else {
      Get.dialog(showAlertDialogOneAction("Algo salió mal", "Debe llenar todos los campos", Icons.info, blue1Color));
      /*Get.dialog(AlertDialog(
        title: Text("error "),
        content: Text("ingrese algo pendejo"),
      ));*/
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose

    print("on Close");
    super.onClose();
  }
}
