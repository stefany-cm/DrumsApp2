import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget _titleTematicaFinalizadaAlert(String title, IconData icon, Color color) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40))),
    child: Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      ],
    ),
  );
}

showAlertDialog(BuildContext context, String title, String text, IconData icon,
    Color color, String route) {
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          titlePadding: EdgeInsets.all(0),
          title: _titleTematicaFinalizadaAlert(title, icon, color),
          content: Text(
            text,
            style: TextStyle(color: Colors.grey[700], fontSize: 18),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              color: Colors.grey[300],
              child: Text(
                "Volver",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              color: color,
              child: Text(
                "Confirmar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
            )
          ],
        );
      });
}

showAlertDialogOneAction(
    String title, String text, IconData icon, Color color) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20))),
    titlePadding: EdgeInsets.all(0),
    title: _titleTematicaFinalizadaAlert(title, icon, color),
    content: Text(
      text,
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
      textAlign: TextAlign.center,
    ),
    actions: <Widget>[
      RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        color: color,
        child: Text(
          "Aceptar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.back();
        },
      )
    ],
  );
}