import 'package:drumsapp2/src/controllers/matrizE_controller.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';
import 'package:drumsapp2/src/widgets/matrix_colection_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ViewExercisesV2 extends StatefulWidget {
  final List<List<int>> matrix;
  final String nameExercises;

  ViewExercisesV2({Key key, this.matrix, this.nameExercises}) : super(key: key);

  @override
  _ViewExercisesV2State createState() => _ViewExercisesV2State();
}

class _ViewExercisesV2State extends State<ViewExercisesV2> {
  //List<List<int>> matrix = [[1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 1, 0, 0, 0]];

  MatrixCollectionExercises matrixColl;
  bool respu;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatrizControllerE>(
        init: MatrizControllerE(),
        id: 'matriz',
        builder: (_) {
          print(_.rhythm.id);
          if (_.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            matrixColl = MatrixCollectionExercises(
                matrix: _.listResp, nameExercio: _.name);

            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: _linearAppBarActions(_.name, greenColor, context
                      /*showAlertDialog(
                          context,
                          resp ? "Intentalo nuevamente" : "Nivel completado",
                          resp
                              ? "Parece que ha tenido problemas. Inténtelo nuevamente o refuerce su teoría"
                              : "Realizó con éxito el ejercicio. Continúe midiendo sus conocimientos",
                          resp ? Icons.mood_bad : Icons.check_circle,
                          orangeColor,
                          "/listExercises2")*/
                      )),
              body:

                  //  if(CircularProgressIndicator()){

                  //  }else{
                  // MatrixCollection(),
                  //  }
                  matrixColl,
            );
          }
        });
  }

  _linearAppBarActions(String text, Color colorL, BuildContext context) {
    bool respu = false;

    Widget _titleTematicaFinalizadaAlert() {
      return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Column(
          children: [
            Icon(
              respu ? Icons.mood_bad : Icons.check_circle,
              color: Colors.white,
              size: 45,
            ),
            Text(
              respu ? "Intentalo nuevamente" : "Nivel completado",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      );
    }

    showAlertDialogH() {
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
              title: _titleTematicaFinalizadaAlert(),
              content: Text(
                respu
                    ? "Parece que ha tenido problemas. Inténtelo nuevamente o refuerce su teoría"
                    : "Realizó con éxito el ejercicio. Continúe midiendo sus conocimientos",
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
                  color: greenColor,
                  child: Text(
                    respu ? "Ver teoria" : "Aceptar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
                    respu
                        ? Navigator.of(context).pushNamed("/listTeory")
                        : Navigator.of(context).pushNamed("/listExercises2");
                  },
                )
              ],
            );
          });
    }

    Widget icnBtn;
    respu
        ? icnBtn = SizedBox(height: 0)
        : icnBtn = IconButton(
            icon: Icon(Icons.check, size: 30),
            onPressed: () {
              bool verification = false;
              List<List<int>> m = matrixColl.getIns.getCompare;
              for (int i = 0; i < matrixColl.matrix.length; i++) {
                for (int j = 0; j < matrixColl.matrix[i].length; j++) {
                  if (matrixColl.getIns.getCompare[i][j] == null) {
                    m[i][j] = 0;
                  }
                  if (matrixColl.matrix[i][j] != m[i][j]) {
                    print("DIFERENTE EN $i $j");
                    verification = true;
                  }
                }
              }
              respu = verification;
              showAlertDialogH();
            });

    return AppBar(
        automaticallyImplyLeading: false, // hides leading widget
        title: Text(text, style: textStyleSemiBold),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitDown,
                DeviceOrientation.portraitUp,
              ]);
              Navigator.of(context).pushNamed("/listExercises2");
            }),
        centerTitle: true,
        backgroundColor: colorL,
        actions: <Widget>[icnBtn]);
  }
}
